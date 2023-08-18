class ApplicationController < ActionController::Base

  protected

  helper_method :signed_in?, :current_user

  def sign_in!(user)
    UserLogin.create(user: user, login_at: Time.now)
    session[:user_id] = user.id
  end

  def signed_in?
    !session[:user_id].nil?
  end

  def current_user
    @user ||= signed_in? ? User.find(session[:user_id]) : User.new
  end

  def authenticate_user!
    unless signed_in?
      flash[:error] = 'Authentication Required to Continue'
      return redirect_to homepage_path(redirect_to: request.original_url)
    end
  end

  def render_not_found
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  end
end
