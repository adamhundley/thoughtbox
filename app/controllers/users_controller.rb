class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
    session[:user_id] = @user.id
    flash[:info] = "Hey #{@user.email}, welcome to THOUGHTBOX"
    redirect_to root_path
    else
      flash.now[:alert] = "Whoops! #{@user.errors.full_messages.join(', ')}"
      render :new
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
