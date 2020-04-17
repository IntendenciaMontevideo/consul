class SiteCustomization::Page < ActiveRecord::Base
  include Imageable
  VALID_STATUSES = %w(draft published)

  before_save :strip_categories

  validates :slug, presence: true,
                   uniqueness: { case_sensitive: false },
                   format: { with: /\A[0-9a-zA-Z\-_]*\Z/, message: :slug_format }
  validates :title, presence: true
  validates :status, presence: true, inclusion: { in: VALID_STATUSES }
  validates :locale, presence: true
  validates :summary, presence: true
  validates :image, presence: true
  validates :related_pages_count, presence: true, numericality: { greater_or_equal_than: 0 }

  scope :published, -> { where(status: 'published').order('id DESC') }
  scope :with_more_info_flag, -> { where(status: 'published', more_info_flag: true).order('id ASC') }
  scope :with_same_locale, -> { where(locale: I18n.locale).order('id ASC') }
  scope :with_add_in_menu, -> { published.where(add_in_menu: true) }

  def url
    "/#{slug}"
  end

  def self.get_categories
    categories = SiteCustomization::Page.where.not(categories: [nil, ""]).pluck('categories').join(',')
    categories.split(',').uniq
  end

  def get_related_pages
    if !self.categories.blank? && self.related_pages_count > 0
      pages = SiteCustomization::Page.where("id != #{self.id}").published
      query = ''
      pages_categories = self.categories.split(',').uniq
      categories_limit = pages_categories.count - 1
      pages_categories.each_with_index do |category, index|
        if index == categories_limit
          query += "categories ILIKE '%#{category}%'"
        else
          query += "categories ILIKE '%#{category}%' OR "
        end
      end
      pages.where(query).order(updated_at: :desc).limit(self.related_pages_count)
    else
      []
    end
  end

  def strip_categories
    self.categories = categories.split(',').map!(&:strip).map!(&:downcase).join(',')
  end
end
