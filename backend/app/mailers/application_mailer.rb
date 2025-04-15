# frozen_string_literal: true

# ApplicationMailer serves as the base class for all mailers in the application.
# It provides default configurations for sending emails, such as the default sender email address
# and the layout to be used for email templates.
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
