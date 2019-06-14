class NewsletterUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :newsletter

  def delivered!
    self.update(delivery: true, delivery_at: Time.now)
  end
end
