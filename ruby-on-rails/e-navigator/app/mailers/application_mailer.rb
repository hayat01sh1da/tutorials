# frozen_string_literal: true
# rbs_inline: enabled

class ApplicationMailer < ActionMailer::Base
  default from: 'reminder@example.com'
  layout 'mailer'
end
