class UsersController < ApplicationController
  skip_before_action :authenticate, only: [:new, :create]
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/register'
      flash[:notice] = user.errors.full_messages.join(", ")
    end
  end
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
