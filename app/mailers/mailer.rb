class Mailer < ActionMailer::Base
  default from: 'noreply@gospodarstwo.pl'

  def sample_email (params = {})
    setup_email(params[:email])
    # set or overwrite variables
    send_mail
  end

  private
  def setup_email(email)
    @subject = "[Gospodarstwo Piotr Gaj] "
    @to      = email.nil? ? " PZU Generator Pomysłów <noreply@gospodarstwo.pl>" : "#{email}"
    @from    = "Gospodarstwo Piotr Gaj <noreply@gospodarstwo.pl>"
    @sent_on = Time.now
    headers 'Return-Path' => "noreply@gospodarstwo.pl"
  end

  def send_mail(options = {})
    options[:subject] ||= @subject
    options[:from] ||= @from
    options[:reply_to] ||= @reply_to
    options[:bcc] ||= @bcc
    options[:to] ||= @to
    options[:cc] ||= @cc
    attachments[@attachment.original_filename] = File.read(@attachment.tempfile) if @attachment
    mail options
  end

  def admin_emails
    Admin.all.map(&:email).join(', ')
  end
end
