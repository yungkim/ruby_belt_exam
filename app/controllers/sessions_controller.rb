class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(users_params[:email])
    if @user.present? && @user = @user.authenticate(users_params[:password])
      session[:user_id] = @user.id
      redirect_to '/songs/index'
    else
      flash[:alert] = "Login Failed: Invalid account."
      redirect_to '/'
    end
  end

# Use this in view: <%= link_to 'Destroy', product, method: :delete, data: { confirm: 'Are you sure?' } %>

# other examples:
# <td><%= link_to 'Show', product %></td>
# <td><%= link_to 'Edit', edit_product_path(product) %></td>
  def destroy
    session.clear
    flash[:alert] = "You have successfully logged out!"
    redirect_to '/'
  end
  private
  def users_params
      params.require(:user).permit(:email, :password)
  end
end
