
class SigninController < ApplicationController
  class InvalidPasswordError < StandardError; end

  def signin_submit
    user = User.find_by!(email: params[:email])
    raise InvalidPasswordError unless user.password == params[:password]
    sign_in! user
    flash[:success] = 'Welcome back, %s!' % user.email
    redirect_to params[:redirect_to] || members_dashboard_path
  rescue ActiveRecord::RecordNotFound, InvalidPasswordError => e
    flash[:error] = 'Username and/or Password are incorrect'
    redirect_to homepage_path
  end

  def logout
    session.destroy
    flash[:success] = 'You have been signed out'
    redirect_to homepage_path
  end

end
