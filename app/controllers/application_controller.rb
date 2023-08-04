class ApplicationController < ActionController::Base

  protected

  def sign_in!(user)
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
end
