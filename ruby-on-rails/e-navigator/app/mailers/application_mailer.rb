# frozen_string_literal: true
# rbs_inline: enabled

# Base mailer class shared by every mailer in the app.
class ApplicationMailer < ActionMailer::Base
  default from: 'reminder@example.com'
  layout 'mailer'
end
