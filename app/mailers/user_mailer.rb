class UserMailer < ActionMailer::Base
  default from: "no-reply@certchecker.herokuapp.com"

  def notification_email(domain)
    @domain = domain
    @user = domain.user
    @url  = domain.host
    mail(to: @user.email, subject: 'Certificate status notification for '+@url)
  end

  def alert_email(domain)
    @domain = domain
    @user = domain.user
    @url  = domain.host
    mail(to: @user.email, subject: 'Certificate Expired for '+@url)
  end
end
