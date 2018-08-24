class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new(session)
  end

  def create
    @user_session = UserSession.new(session, params[:user_session])

    if @user_session.authenticate!
      redirect_to root_path, notice: t('flash.notice.signed_in')
    else
      render :new
    end
  end

  def destroy
    # Ainda não :-)
  end
end

def authenticate!
  user = User.authenticate(@email, @password)

  if user.present?
    store(user)
  else
    errors.add(:base, :invalid_login)
    false
  end
end