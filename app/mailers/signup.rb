class Signup < ActionMailer::Base
  default from: 'no-reply@colcho.net'

  def confirm_email(user)
    @user = user
    # Link temporário pois a funcionalidade ainda
    # não existe, vamos criar ainda neste capítulo
    @confirmation_link = root_url
    mail({
      to: user.email,
      bcc: ['sign ups <signups@colcho.net>'],
      subject: I18n.t('signup.confirm_email.subject')
    })
  end
end