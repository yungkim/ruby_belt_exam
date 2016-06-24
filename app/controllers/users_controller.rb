class UsersController < ApplicationController
  def create
    user = User.new(users_params)
    if user.save
      session[:user_id] = user.id
      flash[:notice] = "Welcome #{user.first_name}"
      redirect_to '/songs/index'
    else
      flash[:errors] = user.errors.full_messages
      redirect_to '/'
    end
  end

  def show
      @user = User.find(params[:id])
  end

  private
  def users_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
