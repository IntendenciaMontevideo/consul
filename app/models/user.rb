class User < ActiveRecord::Base
  devise :omniauthable, :omniauth_providers => [:saml, :facebook, :twitter, :google_oauth2]

  include Verification

  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable,
         :trackable, :validatable, :omniauthable, :async, :password_expirable, :secure_validatable,
         authentication_keys: [:login]

  acts_as_voter
  acts_as_paranoid column: :hidden_at
  include ActsAsParanoidAliases

  include Graphqlable

  has_one :administrator
  has_one :moderator
  has_one :valuator
  has_one :manager
  has_one :poll_officer, class_name: "Poll::Officer"
  has_one :organization
  has_one :lock
  has_many :flags
  has_many :identities, dependent: :destroy
  has_many :debates, -> { with_hidden }, foreign_key: :author_id
  has_many :proposals, -> { with_hidden }, foreign_key: :author_id
  has_many :budget_investments, -> { with_hidden }, foreign_key: :author_id, class_name: 'Budget::Investment'
  has_many :comments, -> { with_hidden }
  has_many :spending_proposals, foreign_key: :author_id
  has_many :failed_census_calls
  has_many :notifications
  has_many :direct_messages_sent,     class_name: 'DirectMessage', foreign_key: :sender_id
  has_many :direct_messages_received, class_name: 'DirectMessage', foreign_key: :receiver_id
  has_many :legislation_answers, class_name: 'Legislation::Answer', dependent: :destroy, inverse_of: :user
  has_many :follows
  belongs_to :geozone

  validates :username, presence: true, if: :username_required?
  validates :username, uniqueness: { scope: :registering_with_oauth }, if: :username_required?
  validates :document_number, uniqueness: { scope: :document_type }, allow_nil: true

  validate :validate_username_length

  validates :official_level, inclusion: {in: 0..5}
  validates :terms_of_service, acceptance: { allow_nil: false }, on: :create

  validates_associated :organization, message: false

  accepts_nested_attributes_for :organization, update_only: true

  attr_accessor :skip_password_validation
  attr_accessor :use_redeemable_code
  attr_accessor :login

  scope :administrators, -> { joins(:administrators) }
  scope :moderators,     -> { joins(:moderator) }
  scope :organizations,  -> { joins(:organization) }
  scope :officials,      -> { where("official_level > 0") }
  scope :newsletter,     -> { where(newsletter: true) }
  scope :for_render,     -> { includes(:organization) }
  scope :by_document,    ->(document_type, document_number) { where(document_type: document_type, document_number: document_number) }
  scope :email_digest,   -> { where(email_digest: true) }
  scope :active,         -> { where(erased_at: nil) }
  scope :erased,         -> { where.not(erased_at: nil) }
  scope :public_for_api, -> { all }
  scope :by_comments,    ->(query, topics_ids) { joins(:comments).where(query, topics_ids).uniq }
  scope :by_authors,     ->(author_ids) { where("users.id IN (?)", author_ids) }

  before_validation :clean_document_number

  # Get the existing user by email if the provider gives us a verified email.
  def self.first_or_initialize_for_oauth(auth)
    oauth_email           = auth.info.email
    oauth_email_confirmed = oauth_email.present? && (auth.info.verified || auth.info.verified_email)
    oauth_user            = User.find_by(email: oauth_email) if oauth_email_confirmed

    oauth_user || User.new(
      username:  auth.info.name || auth.uid,
      first_name: auth.info.name,
      email: oauth_email,
      oauth_email: oauth_email,
      password: Devise.friendly_token[0, 20],
      terms_of_service: '1',
      confirmed_at: oauth_email_confirmed ? DateTime.current : nil
    )
  end

  def self.first_or_initialize_for_oauth_saml(auth, user=nil)
    unless user
      oauth_email           = [auth.uid, '@consul.imm.gub.uy'].join
      oauth_email_confirmed = oauth_email.present?
      oauth_user            = User.find_by(email: oauth_email) if oauth_email_confirmed
    else
      oauth_user = user
    end
    user_attributes = auth.extra.raw_info.attributes

    if oauth_user.blank?
      username = [user_attributes['http://wso2.org/claims/givenname'].first, user_attributes['http://wso2.org/claims/lastname'].first].join(' ')
      user_count = User.where("username like '#{username}%'").count
      username = [username, user_count.to_s].join('_') if user_count > 0
      oauth_user = User.new(
        username:  username,
        email: oauth_email,
        oauth_email: oauth_email,
        password: Devise.friendly_token[0, 20],
        terms_of_service: '1',
        confirmed_at: oauth_email_confirmed ? DateTime.current : nil,
        first_name: user_attributes['http://wso2.org/claims/givenname'].first,
        last_name: user_attributes['http://wso2.org/claims/lastname'].first,
        last_name_2: user_attributes['http://wso2.org/claims/lastname2'].first,
        role: user_attributes['http://wso2.org/claims/role'].first,
        user_certified: user_attributes['http://wso2.org/claims/userCertified'].first == 'true' ? true : false,
        country: user_attributes['http://wso2.org/claims/country'].first,
        document: user_attributes['http://wso2.org/claims/document'].first,
        document_number: user_attributes['http://wso2.org/claims/document'].first,
        document_type: user_attributes['http://wso2.org/claims/documentType'].first,
        user_verified: user_attributes['http://wso2.org/claims/userVerified'].first == 'true' ? true : false,
        middle_name: user_attributes['http://wso2.org/claims/middleName'].first,
        uid: auth.uid
      )
    else
      if auth.extra.raw_info.attributes
        oauth_user.first_name = user_attributes['http://wso2.org/claims/givenname'].first
        oauth_user.last_name = user_attributes['http://wso2.org/claims/lastname'].first
        oauth_user.last_name_2 = user_attributes['http://wso2.org/claims/lastname2'].first
        oauth_user.role = user_attributes['http://wso2.org/claims/role'].first
        oauth_user.user_certified = user_attributes['http://wso2.org/claims/userCertified'].first == 'true' ? true : false
        oauth_user.country = user_attributes['http://wso2.org/claims/country'].first
        oauth_user.document = user_attributes['http://wso2.org/claims/document'].first
        oauth_user.document_number = user_attributes['http://wso2.org/claims/document'].first
        oauth_user.document_type = user_attributes['http://wso2.org/claims/documentType'].first
        oauth_user.user_verified = user_attributes['http://wso2.org/claims/userVerified'].first == 'true' ? true : false
        oauth_user.middle_name = user_attributes['http://wso2.org/claims/middleName'].first
        oauth_user.uid = auth.uid
      end
    end

    if (oauth_user.uid.include?('uy-ci') || oauth_user.uid.include?('uy-dni')) && oauth_user.residence_verified_at.blank?
      oauth_user.residence_verified_at = Date.today
      oauth_user.level_two_verified_at = Date.today
    end
    if (oauth_user.uid.include?('uy-ci') || oauth_user.uid.include?('uy-dni')) && (oauth_user.user_certified || oauth_user.user_verified) && oauth_user.verified_at.blank?
      oauth_user.verified_at = Date.today
    end

    oauth_user
  end

  def name
    organization? ? organization.name : username
  end

  def debate_votes(debates)
    voted = votes.for_debates(Array(debates).map(&:id))
    voted.each_with_object({}) { |v, h| h[v.votable_id] = v.value }
  end

  def proposal_votes(proposals)
    voted = votes.for_proposals(Array(proposals).map(&:id))
    voted.each_with_object({}) { |v, h| h[v.votable_id] = v.value }
  end

  def legislation_proposal_votes(proposals)
    voted = votes.for_legislation_proposals(proposals)
    voted.each_with_object({}) { |v, h| h[v.votable_id] = v.value }
  end


  def spending_proposal_votes(spending_proposals)
    voted = votes.for_spending_proposals(spending_proposals)
    voted.each_with_object({}) { |v, h| h[v.votable_id] = v.value }
  end

  def budget_investment_votes(budget_investments)
    voted = votes.for_budget_investments(budget_investments)
    voted.each_with_object({}) { |v, h| h[v.votable_id] = v.value }
  end

  def comment_flags(comments)
    comment_flags = flags.for_comments(comments)
    comment_flags.each_with_object({}){ |f, h| h[f.flaggable_id] = true }
  end

  def voted_in_group?(group)
    votes.for_budget_investments(Budget::Investment.where(group: group)).exists?
  end

  def administrator?
    administrator.present?
  end

  def moderator?
    moderator.present?
  end

  def valuator?
    valuator.present?
  end

  def manager?
    manager.present?
  end

  def poll_officer?
    poll_officer.present?
  end

  def organization?
    organization.present?
  end

  def verified_organization?
    organization && organization.verified?
  end

  def official?
    official_level && official_level > 0
  end

  def add_official_position!(position, level)
    return if position.blank? || level.blank?
    update official_position: position, official_level: level.to_i
  end

  def remove_official_position!
    update official_position: nil, official_level: 0
  end

  def has_official_email?
    domain = Setting['email_domain_for_officials']
    email.present? && ((email.end_with? "@#{domain}") || (email.end_with? ".#{domain}"))
  end

  def display_official_position_badge?
    return true if official_level > 1
    official_position_badge? && official_level == 1
  end

  def block
    debates_ids = Debate.where(author_id: id).pluck(:id)
    comments_ids = Comment.where(user_id: id).pluck(:id)
    proposal_ids = Proposal.where(author_id: id).pluck(:id)

    hide

    Debate.hide_all debates_ids
    Comment.hide_all comments_ids
    Proposal.hide_all proposal_ids
  end

  def erase(erase_reason = nil)
    update(
      erased_at: Time.current,
      erase_reason: erase_reason,
      username: nil,
      email: nil,
      unconfirmed_email: nil,
      phone_number: nil,
      encrypted_password: "",
      confirmation_token: nil,
      reset_password_token: nil,
      email_verification_token: nil,
      confirmed_phone: nil,
      unconfirmed_phone: nil
    )
    identities.destroy_all
  end

  def erased?
    erased_at.present?
  end

  def take_votes_if_erased_document(document_number, document_type)
    erased_user = User.erased.where(document_number: document_number).where(document_type: document_type).first
    if erased_user.present?
      take_votes_from(erased_user)
      erased_user.update(document_number: nil, document_type: nil)
    end
  end

  def take_votes_from(other_user)
    return if other_user.blank?
    Poll::Voter.where(user_id: other_user.id).update_all(user_id: id)
    Budget::Ballot.where(user_id: other_user.id).update_all(user_id: id)
    Vote.where("voter_id = ? AND voter_type = ?", other_user.id, "User").update_all(voter_id: id)
    update(former_users_data_log: "#{former_users_data_log} | id: #{other_user.id} - #{Time.current.strftime('%Y-%m-%d %H:%M:%S')}")
  end

  def locked?
    Lock.find_or_create_by(user: self).locked?
  end

  def self.search(term)
    term.present? ? where("email = ? OR username ILIKE ?", term, "%#{term}%") : none
  end

  def self.username_max_length
    @@username_max_length ||= columns.find { |c| c.name == 'username' }.limit || 60
  end

  def self.minimum_required_age
    (Setting['min_age_to_participate'] || 16).to_i
  end

  def show_welcome_screen?
    sign_in_count == 1 && unverified? && !organization && !administrator?
  end

  def password_required?
    return false if skip_password_validation
    super
  end

  def username_required?
    !organization? && !erased?
  end

  def email_required?
    !erased? && unverified?
  end

  def locale
    self[:locale] ||= I18n.default_locale.to_s
  end

  def confirmation_required?
    super && !registering_with_oauth
  end

  def send_oauth_confirmation_instructions
    if oauth_email != email
      update(confirmed_at: nil)
      send_confirmation_instructions
    end
    update(oauth_email: nil) if oauth_email.present?
  end

  def name_and_email
    "#{name} (#{email})"
  end

  def age
    Age.in_years(date_of_birth)
  end

  def save_requiring_finish_signup
    begin
      self.registering_with_oauth = true
      save(validate: false)
    # Devise puts unique constraints for the email the db, so we must detect & handle that
    rescue ActiveRecord::RecordNotUnique
      self.email = nil
      save(validate: false)
    end
    true
  end

  def ability
    @ability ||= Ability.new(self)
  end
  delegate :can?, :cannot?, to: :ability

  def public_proposals
    public_activity? ? proposals : User.none
  end

  def public_debates
    public_activity? ? debates : User.none
  end

  def public_comments
    public_activity? ? comments : User.none
  end

  # overwritting of Devise method to allow login using email OR username
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions.to_hash).where(["lower(email) = ?", login.downcase]).first ||
    where(conditions.to_hash).where(["username = ?", login]).first
  end

  def interests
    follows.map{|follow| follow.followable.tags.map(&:name)}.flatten.compact.uniq
  end

  private

    def clean_document_number
      self.document_number = document_number.gsub(/[^a-z0-9]+/i, "").upcase if document_number.present?
    end

    def validate_username_length
      validator = ActiveModel::Validations::LengthValidator.new(
        attributes: :username,
        maximum: User.username_max_length)
      validator.validate(self)
    end

end
