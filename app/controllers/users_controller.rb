class UsersController < ApplicationController

  before_action :signed_in_user, :except => [:new, :create]
  #before_action :correct_user

  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      sign_in @user
      flash[:success] = "Registration successful. Welcome!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    #Before filters

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end
