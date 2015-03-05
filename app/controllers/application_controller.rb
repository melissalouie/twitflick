class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    User.find_by_id(session[:user_id])
  end

  def other_users
    User.where.not(id: session[:user_id])
  end

  helper_method :current_user
  helper_method :other_users

  def authenticate
    redirect_to login_path, :alert => 'You must be logged in to visit that page.' unless current_user
  end

  def authenticate_admin
    redirect_to root_url, :alert => 'You must be an admin to do that. Condolences. :-(' unless current_user.admin == true
  end

end
