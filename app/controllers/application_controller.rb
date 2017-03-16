class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    if session[:user_id]
      user = User.find(session[:user_id])
    end
  end

  def logged_in?
    !!current_user
  end

  def find_user_by_session_id
    @user = User.find(session[:user_id])
  end
end
