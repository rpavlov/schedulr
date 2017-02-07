class SessionsController < ApplicationController
  skip_before_action :authenticate, only: [:new, :create, :destroy]

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:notice]="Incorrect email or password."
      redirect_to '/login'
    end
  end

  def new
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end

