class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])

    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id

      flash[:notice] = "Thanks for signing in, #{user.first_name}!"
      redirect_to root_path
    else
      flash[:alert] = "Invalid email or password!"
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil

    flash[:notice] = "Successfully signed out!"
    redirect_to root_path
  end
end
