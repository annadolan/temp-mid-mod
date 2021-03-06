class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "Welcome #{@user.name}!"
      redirect_to root_path
    else
      flash.now[:danger] = "Something went wrong, please try again."
      render :new
    end
  end

  def destroy
    session.destroy
    flash[:success] = "You are logged out. See you later!"
    redirect_to root_path
  end
end
