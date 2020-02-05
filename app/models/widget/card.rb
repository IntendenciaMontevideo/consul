class Widget::Card < ActiveRecord::Base
  include Imageable

  self.table_name = "widget_cards"

  scope :without_init_end_datetime, -> { where(init_datetime: nil, end_datetime: nil) }
  scope :only_with_init_datetime,   -> { where('init_datetime <=? AND end_datetime is NULL', Time.now) }
  scope :only_with_end_datetime,    -> { where('end_datetime >=? AND init_datetime is NULL', Time.now) }
  scope :with_init_end_datetime,    -> { where('init_datetime <=? AND end_datetime >=?', Time.now, Time.now) }

  def self.header
    where(header: true)
  end

  def self.body
    where(header: false).order(:created_at)
  end

end
