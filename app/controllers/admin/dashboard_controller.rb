class Admin::DashboardController < ApplicationController
    
    before_action :authorize_admin!
  
    def index
      @users = User.order(created_at: :desc)
    end

    def update
        render json: params
    end
  
    private
    def authorize_admin!
      unless current_user.admin?
        flash[:alert] = "Access Denied!"
        redirect_to root_path
      end
    end
end
