class ApplicationMailer < ActionMailer::Base
  helper :settings
  default from: "#{Setting['mailer_from_name']} <#{Setting['mailer_from_address']}>"
  layout 'mailer'
  layout false, :only => 'welcome_email'
end
