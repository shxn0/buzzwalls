class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_wall.subject
  #
  def sendmail_wall
    @greeting = "Hi"

    mail to: "新しい写真が投稿されました！"
  end
end
