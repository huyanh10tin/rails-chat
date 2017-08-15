class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  private
  def require_login
    unless current_user
      redirect_to new_user_path, flash: {error: "You must Login or Create an Account to view this page."}
    end
  end

  def login(user)
    session[:user_id] = user.id
  end

  def logout(user)
    session[:user_id] = nil
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
