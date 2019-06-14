class ApplicationMailer < ActionMailer::Base
  helper :settings
  default from: "#{Setting['mailer_from_name']} <#{Setting['mailer_from_address']}>"
  layout 'mailer'
  layout false, :only => [:welcome_email, :email_ticket_vote, :comment, :reply, :direct_message_for_sender, :direct_message_for_receiver, :newsletter]

  before_filter :add_inline_attachments!

  private
  def add_inline_attachments!
    attachments.inline['header_email.png'] = File.read("#{Rails.root}/app/assets/images/custom/header_email.png")
  end
end
