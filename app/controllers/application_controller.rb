class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def sign_in(user)
    session[:user_id] = user.id
  end

  def require_sign_in
    unless current_user
      redirect_back alert: 'You must be logged in to do that.', fallback_location: root_path
    end
  end
end
