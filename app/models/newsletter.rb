class Newsletter < ActiveRecord::Base


  has_many :newsletter_users, dependent: :destroy
  has_many :users, through: :newsletter_users


  validates :subject, presence: true
  validates :segment_recipient, presence: true
  validates :from, presence: true
  validates :body, presence: true
  validates :test_email, presence: true
  validates :email_to, presence: true
  validate :validate_segment_recipient

  STATUS = { not_initialized: 1, initializated: 2, restarted: 3, paused: 4, canceled: 5, finished: 6 }

  validates_format_of :from, :test_email, :with => /@/

  MAX_EMAILS_SENDED = 500

  def list_of_recipient_emails
    UserSegments.user_segment_emails(segment_recipient) if valid_segment_recipient?
  end

  def valid_segment_recipient?
    segment_recipient && UserSegments.respond_to?(segment_recipient)
  end

  def mails_sended
    newsletter_users.where(delivery: true)
  end

  def mails_not_sended
    newsletter_users.where(delivery: false).includes(:user).joins(:user).where("users.email_on_newsletter": true)
  end

  def draft?
    sent_at.nil?
  end

  def cancel!
    self.status = STATUS[:canceled]
    self.save
  end

  def pause!
    self.status = STATUS[:paused]
    self.save
  end

  def restart!
    self.status = STATUS[:restarted]
    self.save
  end

  def finish!
    self.status = STATUS[:finished]
    self.save
  end

  def initializate!
    self.status = STATUS[:initializated]
    self.sent_at = Date.today
    self.save
  end

  def canceled?
    self.status == STATUS[:canceled]
  end

  def restarted?
    self.status == STATUS[:restarted]
  end

  def paused?
    self.status == STATUS[:paused]
  end

  def initializated?
    self.status == STATUS[:initializated]
  end

  def not_initialized?
    self.status == STATUS[:not_initialized]
  end

  def finished?
    self.status == STATUS[:finished]
  end

  def self.send_newsletter
    count_emails = 0
    #newsletter initializated
    newsletters = Newsletter.where(status: STATUS[:initializated]).order(created_at: :asc)
    newsletters.each do |newsletter|
      list_emails = []
      list_newsletter_user_ids = []
      newsletter.mails_not_sended.limit(MAX_EMAILS_SENDED).each do |newsletter_user|
        list_emails.push newsletter_user.user.email
        list_newsletter_user_ids.push newsletter_user.id
      end
      begin
        Mailer.newsletter(newsletter, list_emails).deliver_later
        count_emails = count_emails + list_emails.count
        NewsletterUser.where(id: list_newsletter_user_ids).update_all(delivery: true, delivery_at: Time.now)
      rescue
      end
      if newsletter.mails_not_sended.count == 0
        newsletter.finish!
      end
      if count_emails >= MAX_EMAILS_SENDED
        break
      end
    end

    #newsletter restarted
    if count_emails < MAX_EMAILS_SENDED
      newsletters = Newsletter.where(status: STATUS[:restarted]).order(created_at: :asc)
      newsletters.each do |newsletter|
        list_emails = []
        list_newsletter_user_ids = []
        newsletter.mails_not_sended.limit(MAX_EMAILS_SENDED - count_emails).each do |newsletter_user|
          list_emails.push newsletter_user.user.email
          list_newsletter_user_ids.push newsletter_user.id
        end
        begin
          Mailer.newsletter(newsletter, list_emails).deliver_later
          count_emails = count_emails + list_emails.count
          NewsletterUser.where(id: list_newsletter_user_ids).update_all(delivery: true, delivery_at: Time.now)
        rescue
        end
        if newsletter.mails_not_sended.count == 0
          newsletter.finish!
        end
        if count_emails >= MAX_EMAILS_SENDED
          break
        end
      end
    end

    #newsletter not inicialized
    if count_emails < MAX_EMAILS_SENDED
      newsletters = Newsletter.where(status: STATUS[:not_initialized]).order(created_at: :asc)
      newsletters.each do |newsletter|
        newsletter.initializate!
        list_emails = []
        list_newsletter_user_ids = []
        newsletter.mails_not_sended.limit(MAX_EMAILS_SENDED - count_emails).each do |newsletter_user|
          list_emails.push newsletter_user.user.email
          list_newsletter_user_ids.push newsletter_user.id
        end
        begin
          Mailer.newsletter(newsletter, list_emails).deliver_later
          count_emails = count_emails + list_emails.count
          NewsletterUser.where(id: list_newsletter_user_ids).update_all(delivery: true, delivery_at: Time.now)
        rescue
        end
        if newsletter.mails_not_sended.count == 0
          newsletter.finish!
        end
        if count_emails >= MAX_EMAILS_SENDED
          break
        end
      end
    end

  end

  private

  def validate_segment_recipient
    errors.add(:segment_recipient, :invalid) unless valid_segment_recipient?
  end
end
