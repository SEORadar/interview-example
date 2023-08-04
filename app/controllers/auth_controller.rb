
class AuthController < ApplicationController
  class InvalidPasswordError < StandardError; end

  def auth_user
    user = User.find_by!(email: params[:email])
    raise InvalidPasswordError unless user.password == params[:password]
    sign_in! user
    flash[:success] = 'Welcom back, %s!' % user.email
    redirect_to params[:redirect_to] || members_dashboard_path
  rescue ActiveRecord::RecordNotFound, InvalidPasswordError => e
    flash[:error] = 'Username and/or Password are incorrect'
    redirect_to homepage_path
  end

  def logout
    session.destroy
    redirect_to homepage_path
  end

end
