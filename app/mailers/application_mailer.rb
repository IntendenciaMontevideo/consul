class ApplicationMailer < ActionMailer::Base
  helper :settings
  default from: "#{Setting['mailer_from_name']} <#{Setting['mailer_from_address']}>"
  layout 'mailer'
  layout false, :only => 'welcome_email'

  before_filter :add_inline_attachments!

  private
  def add_inline_attachments!
    attachments.inline['logo_email.png'] = File.read("#{Rails.root}/app/assets/images/logo_email.png")
  end
end
