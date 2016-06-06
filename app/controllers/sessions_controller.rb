class SessionsController < ApplicationController
  def new
    session[:return_to] ||= request.referer
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id]  = user.id
      flash[:info] = "Hey #{user.email}, welcome to THOUGHTBOX"
      redirect_to links_path
    else
        flash.now[:alert] = "Sorry, friend.  Something went wrong :(... Please try again."
        render :new
    end
  end

  def destroy
    flash[:bye] = "Sad to see you go #{current_user.email}. Come back again soon. 👋"
    session.clear
    redirect_to root_path
  end
end
