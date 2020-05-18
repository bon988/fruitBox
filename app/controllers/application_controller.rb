class ApplicationController < ActionController::Base
  #helper method macro to assist with making the curent_user method accessible to Views 
  helper_method :current_user
  
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end
end

 
