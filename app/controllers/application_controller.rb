class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :authenticate
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end
  def authenticate
    redirect_to '/login' unless current_user
  end
  # def authorized_phase?(phase)
  #   redirect_to disabled_survey_submissions_path if @survey.disabled_phases.include? phase
  # end
end
