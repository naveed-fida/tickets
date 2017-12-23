class SessionsController < ApplicationController
  def new; end
  def create
    user = User.find_by(email: params[:email])
    binding.pry
    if user && user.authenticate(params[:password])
      sign_in user
      redirect_to root_path, notice: "Welcome #{user.name}!"
    else
      redirect_to login_path, alert: "You can't login. Please check your username and/or password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You've been logged out!"
  end
end
