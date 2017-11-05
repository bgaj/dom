class NotificationMailer < Mailer
  layout 'mailer'
  def notify(user, params = {})
    setup_email("bartek.gaj1992@gmail.com")
    @subject = @subject + "Powiadomienie"
    @message = params[:message]
    @time = params[:time]
    send_mail
  end
end
