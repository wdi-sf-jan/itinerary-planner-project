class AccessController < ApplicationController

  def home
    if is_logged_in
      @user = User.find_by_id(user_id)
    end
    unless @user
      redirect_to :login
    end
  end

  def signup
    if is_logged_in
      redirect_to root_path
    end
  end

  def login
    if is_logged_in
      redirect_to root_path
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to :login
  end

  def create
    user = User.new user_params
    if user.save
      session[:user_id] = user.id
      flash[:success] = "You are now logged in!"
      redirect_to root_path
    else
      flash[:alert] = "Username already taken"
      redirect_to :signup
    end
  end

  def attempt_login
    if params[:username].present? and params[:password].present?
      found = User.find_by_username params[:username]
      if found
        authorized = found.authenticate params[:password]
      end
    end

    if authorized
      session[:user_id] = authorized.id
      flash[:success] = "You are now logged in!"
      redirect_to root_path
    else
      flash[:alert] = found ? "Invalid password" : "Invalid username"
      redirect_to :login
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

  def user_id
    session[:user_id]
  end

  def is_logged_in
     user_id != nil
  end
end
