class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    if session[:user_id].present?
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
end
