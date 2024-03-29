class SessionsController < ApplicationController

  def new
    session[:previous_pin_page] = request.env['HTTP_REFERER']
  end

  def create
    user = User.find_by(email: params[:session][:email])

    if user && user.authenticate(params[:session][:password])
      log_in(user)
      if params[:session][:remember_me] == '1'
        remember(user)
      else
        forget(user)
      end
      flash[:success] = "You have been logged in"
      if session[:previous_pin_page]
        redirect_to session[:previous_pin_page]
      else
        redirect_to user
      end
    else
      flash[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = "You have been logged out"
    redirect_to root_path
  end

  private
    def session_params
      params.require(:session).permit(:email, :password)
    end
end
