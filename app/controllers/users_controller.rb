class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def new
  	@user = User.new
  end

  def edit
    
  end  

  def create
  	@user = User.new(user_params)
  	if @user.save
      login @user
  		flash[:success] = "Thank you for registering."
  		redirect_to root_url
  	else
  		render 'new'
  	end
  end	

  def update
    if @user.update(user_params)
      flash[:success] = "Update was successful"
      redirect_to root_url
    else
      render 'edit'
    end    
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:full_name, :display_name, :email, :password, :password_confirmation)
    end
end
