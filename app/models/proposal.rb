class Proposal < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  include Flaggable
  include Taggable
  include Conflictable
  include Measurable
  include Sanitizable
  include Searchable
  include Filterable
  include HasPublicAuthor
  include Graphqlable
  include Followable
  include Communitable
  include Imageable
  include Mappable
  include Notifiable
  include Documentable
  documentable max_documents_allowed: 3,
               max_file_size: 3.megabytes,
               accepted_content_types: [ "application/pdf" ]
  include EmbedVideosHelper
  include Relationable

  acts_as_votable
  acts_as_paranoid column: :hidden_at
  include ActsAsParanoidAliases

  RETIRE_OPTIONS = %w(duplicated started unfeasible done other)
  STATES = { open: 1, pre_success: 2, success: 3, not_success: 4, archived: 5}

  belongs_to :author, -> { with_hidden }, class_name: 'User', foreign_key: 'author_id'
  belongs_to :geozone
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :proposal_notifications, dependent: :destroy

  validates :title, presence: true
  validates :summary, presence: true
  validates :author, presence: true
  validates :responsible_name, presence: true
  validates :title, length: { in: 4..Proposal.title_max_length }
  validates :description, length: { maximum: Proposal.description_max_length }
  validates :responsible_name, length: { in: 6..Proposal.responsible_name_max_length }
  validates :retired_reason, inclusion: { in: RETIRE_OPTIONS, allow_nil: true }
  validates :terms_of_service, acceptance: { allow_nil: false }, on: :create

  validate :valid_video_url?

  before_validation :set_responsible_name
  before_save :calculate_hot_score, :calculate_confidence_score
  before_create :set_votes_for_success

  scope :for_render,               -> { includes(:tags) }
  scope :sort_by_hot_score,        -> { reorder(hot_score: :desc) }
  scope :sort_by_confidence_score, -> { reorder(confidence_score: :desc) }
  scope :sort_by_created_at,       -> { reorder(created_at: :desc) }
  scope :sort_by_most_commented,   -> { reorder(comments_count: :desc) }
  scope :sort_by_random,           -> { reorder("RANDOM()") }
  scope :sort_by_relevance,        -> { all }
  scope :sort_by_flags,            -> { order(flags_count: :desc, updated_at: :desc) }
  scope :sort_by_archival_date,    -> { archived.sort_by_confidence_score }
  scope :sort_by_recommendations,  -> { order(cached_votes_up: :desc) }
  scope :archived,                 -> { where("state = ? OR proposals.created_at <= ?", STATES[:archived], [Setting['proposals_start_day'], '/', Setting['proposals_start_month'], '/', Time.zone.now.year].join.to_time) }
  scope :not_archived,             -> { where("state != ? AND proposals.created_at > ?", STATES[:archived], [Setting['proposals_start_day'], '/', Setting['proposals_start_month'], '/', Time.zone.now.year].join.to_time) }
  scope :last_week,                -> { where("proposals.created_at >= ?", 7.days.ago)}
  scope :retired,                  -> { where.not(retired_at: nil) }
  scope :not_retired,              -> { where(retired_at: nil) }
  #scope :successful,               -> { where("cached_votes_up >= ?", Proposal.votes_needed_for_success) }
  scope :successful,               -> { where("state = ?", Proposal::STATES[:success]) }
  scope :unsuccessful,             -> { where.not("state = ?", Proposal::STATES[:success]) }
  scope :public_for_api,           -> { all }
  scope :not_supported_by_user,    ->(user) { where.not(id: user.find_voted_items(votable_type: "Proposal").compact.map(&:id)) }
  scope :not_not_success,          -> { where.not("state = ?", Proposal::STATES[:not_success]) }
  scope :search_between_dates, -> (start_date, end_date) { where('proposals.created_at >= ? AND proposals.created_at <= ?', start_date.beginning_of_day, end_date.beginning_of_day) }
  scope :search_by_status, -> (status) { where(state: status) }
  scope :by_featured, -> { not_archived.where(featured: true).shuffle }
  scope :by_less_than_vote_count, -> (vote_count) { where("cached_votes_up < ?", vote_count) }

  def url
    proposal_path(self)
  end

  def self.recommendations(user)
    tagged_with(user.interests, any: true)
      .where("author_id != ?", user.id)
      .unsuccessful
      .not_followed_by_user(user)
      .not_archived
      .not_supported_by_user(user)
  end

  def self.not_followed_by_user(user)
    where.not(id: followed_by_user(user).pluck(:id))
  end

  def to_param
    "#{id}-#{title}".parameterize
  end

  def searchable_values
    { title              => 'A',
      question           => 'B',
      author.username    => 'B',
      tag_list.join(' ') => 'B',
      geozone.try(:name) => 'B',
      summary            => 'C',
      description        => 'D'
    }
  end

  def self.search(terms)
    by_code = search_by_code(terms.strip)
    by_code.present? ? by_code : pg_search(terms)
  end

  def self.search_by_code(terms)
    matched_code = match_code(terms)
    results = where(id: matched_code[1]) if matched_code
    return results if results.present? && results.first.code == terms
  end

  def self.match_code(terms)
    /\A#{Setting["proposal_code_prefix"]}-\d\d\d\d-\d\d-(\d*)\z/.match(terms)
  end

  def self.for_summary
    summary = {}
    categories = ActsAsTaggableOn::Tag.category_names.sort
    geozones   = Geozone.names.sort

    groups = categories + geozones
    groups.each do |group|
      summary[group] = search(group).last_week.sort_by_confidence_score.limit(3)
    end
    summary
  end

  def self.bulk_archive(ids, archived_text)
    Proposal.where(id: ids).update_all(state: Proposal::STATES[:archived],
      text_show_archived: archived_text, archived_at: Date.today)
  end

  def total_votes
    cached_votes_up
  end

  def voters
    User.active.where(id: votes_for.voters)
  end

  def editable?
    total_votes <= Setting["max_votes_for_proposal_edit"].to_i && !archived? && Proposal.can_create?
  end

  def editable_by?(user)
    author_id == user.id && editable?
  end

  def votable_by?(user)
    user && user.level_two_or_three_verified?
  end

  def retired?
    retired_at.present?
  end

  def register_vote(user, vote_value)
    if votable_by?(user) && !archived?
      vote_by(voter: user, vote: vote_value)
    end
  end

  def code
    "#{Setting['proposal_code_prefix']}-#{created_at.strftime('%Y-%m')}-#{id}"
  end

  def after_commented
    save # updates the hot_score because there is a before_save
  end

  def calculate_hot_score
    self.hot_score = ScoreCalculator.hot_score(created_at,
                                               total_votes,
                                               total_votes,
                                               comments_count)
  end

  def calculate_confidence_score
    self.confidence_score = ScoreCalculator.confidence_score(total_votes, total_votes)
  end

  def after_hide
    tags.each{ |t| t.decrement_custom_counter_for('Proposal') }
  end

  def after_restore
    tags.each{ |t| t.increment_custom_counter_for('Proposal') }
  end

  def self.votes_needed_for_success
    Setting['votes_for_proposal_success'].to_i
  end

  def self.votes_needed_for_pre_success
    Setting['proposals_feasibility_threshold'].to_i
  end

  def successful?
    state == Proposal::STATES[:success] || (pre_successful? && total_votes >= self.votes_for_success)
  end

  def votes_pre_successful?
    self.votes_for_success != 0 && total_votes >= self.votes_for_success
  end

  def not_required_feasibility_threshold?
    self.votes_for_success == 0
  end

  def open?
    state == Proposal::STATES[:open]
  end

  def pre_successful?
    state == Proposal::STATES[:pre_success]
  end

  def not_successful?
    state == Proposal::STATES[:not_success]
  end

  def manually_archived?
    state == Proposal::STATES[:archived]
  end

  def archived?
    #created_at <= Setting["months_to_archive_proposals"].to_i.days.ago
    manually_archived? || (Time.zone.now >= [Setting['proposals_start_day'], '/', Setting['proposals_start_month'], '/', created_at.year + 1].join.to_time.beginning_of_day)
  end

  def notifications
    proposal_notifications
  end

  def users_to_notify
    (voters + followers).uniq
  end

  def self.proposals_orders(user)
    orders = %w{hot_score confidence_score created_at relevance archival_date}
    orders << "recommendations" if user.present?
    orders
  end

  def self.can_create?
    start_time = [Setting['proposals_start_day'], '/', Setting['proposals_start_month'], '/', Date.today.year].join.to_time
    end_time = [Setting['proposals_end_day'], '/', Setting['proposals_end_month'], '/', Date.today.year].join.to_time
    Time.zone.now >= start_time.beginning_of_day && Time.zone.now <= end_time.end_of_day
  end

  def can_vote?
    start_time = [Setting['proposals_vote_start_day'], '/', Setting['proposals_vote_start_month'], '/', created_at.year].join.to_time
    end_time = [Setting['proposals_vote_end_day'], '/', Setting['proposals_vote_end_month'], '/', (created_at.year + 1)].join.to_time
    Time.zone.now >= start_time.beginning_of_day && Time.zone.now <= end_time.end_of_day
  end

  def pre_success!(votes_for_success)
    update(state: STATES[:pre_success], votes_for_success: votes_for_success)
  end

  def success!(text, link)
    update(state: STATES[:success], text_show_finished: text, link_success: link)
  end

  def not_success!(link, text)
    update(state: STATES[:not_success], link_not_success: link, text_show_finished: text)
  end

  def pending!
    update(state: STATES[:open])
  end

  def archived!
    update(state: STATES[:archived], archived_at: Date.today)
  end

  def state_text
    case state
    when STATES[:open]
     'Pendiente'
    when STATES[:pre_success]
     'Pre-Aprobada'
    when STATES[:success]
     'Aprobada'
    when STATES[:not_success]
     'No Aprobada'
    when STATES[:archived]
     'Archivada'
    end
  end

  def self.to_csv
    attributes = %w{id title description_without_html_tags created_at cached_votes_up comments_count}

    CSV.generate(headers: true) do |csv|
      csv << ["Id", "Título", "Descripción", "Creado en", "Cantidad de votos", "Cantidad de comentarios"]

      all.each do |proposal|
        csv << attributes.map{ |attr| proposal.send(attr) }
      end
    end
  end

  def description_without_html_tags
    ActionView::Base.full_sanitizer.sanitize(self.description)
  end

  def self.archived_proposal_without_500_votes
    end_time = [Setting['proposals_end_day'], '/', Setting['proposals_end_month'], '/', Date.today.year].join.to_time
    if Time.zone.now > end_time.end_of_day
      Proposal.not_archived.where("cached_votes_up < 500").each do |proposal|
        p "Proposal archived #{proposal.url}"
        proposal.archived!
      end
    end
  end

  protected

    def set_responsible_name
      if author && author.document_number?
        self.responsible_name = author.document_number
      end
    end

    def set_votes_for_success
      self.votes_for_success = Setting['proposals_feasibility_threshold'].to_i
    end

end
