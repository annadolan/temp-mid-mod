class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome #{@user.name}!"
      redirect_to root_path
      session[:user_id] = @user.id
    elsif User.find_by(email: params[:user][:email])
      flash.now[:danger] = "There is already an email address associated with this account."
      render :new
    else
      flash.now[:danger] = "Please make sure that your password confirmation matches."
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
