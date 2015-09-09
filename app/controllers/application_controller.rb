class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  def log_in_required
    if !logged_in?
      flash[:warning] = "Please login before you can perform this action"
      redirect_to login_path
    end
  end
end
