# frozen_string_literal: true
# rbs_inline: enabled

# Mails interview-apply and interview-approved notifications to the relevant
# parties.
class InterviewMailer < ApplicationMailer
  helper ApplicationHelper

  # メソッド名を変更しました
  def apply(user, approver)
    @user = user
    mail(to: approver.email, subject: I18n.t('interview_mailer.apply.subject'))
  end

  # メソッド名を変更しました
  def approve(approver, interview)
    @interview = interview
    @approver = approver
    mail(
      to: interview.user.email,
      cc: approver.email,
      subject: I18n.t('interview_mailer.approve.subject')
    )
  end
end
