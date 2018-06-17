class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    #toggle_approved
    @user = User.find(params[:id]) 
    @user.update approved: !@user.approved 

    redirect_to admin_dashboard_index_path
  end
  
  private
  
  def toggle_approved!
    @user = current_user 
    user.update approved: !approved 
  end
  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :email,
      :password, :password_confirmation
    )
  end
end
