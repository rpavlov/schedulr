class ApplicationController < ActionController::Base
  include ActionView::Helpers::UrlHelper
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :authenticate
  before_action :check_role
  
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end
  def authenticate
    redirect_to '/login' unless current_user
  end
  def check_role
    if current_user.is_provider?
      redirect_to '/provider/listings' if current_page?(listings_path) || current_page?('/')
    else
      redirect_to '/' if current_page?(provider_listings_path)
    end
    
  end
end
