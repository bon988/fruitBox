class ApplicationController < ActionController::Base
  #
  before_action :authorized
  #
  helper_method :logged_in?
  
  #helper method macro to assist with making the curent_user method accessible to Views 
  helper_method :current_user
  
  def current_user 
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end
  
  def logged_in?
    !current_user.nil?  
  end
  
  def authorized
   redirect_to '/welcome' unless logged_in?
  end
end

 
