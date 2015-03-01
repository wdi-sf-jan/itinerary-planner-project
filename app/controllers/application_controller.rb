class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  def user_id
    session[:user_id]
  end

  def is_logged_in
    user_id != nil
  end

  def current_user
    if is_logged_in
      user = User.find_by_id(user_id)
    end
  end
end
