class SessionsController < ApplicationController
  #authentication/authorization: skip_before_action macro 
  #to skip the authorization on 3 Views (:new, :create, :welcome)
  #so unauthoristed users can access only new, create and welcome Views
  skip_before_action :authorized, only: [:new, :create, :welcome]
  
  #new method
  def new
  end
  
  #login method
  def login
  end

  #create method
  #responsible for finding a user instance based on the email params provided by the form
  #if else statement: to check if the password is a match, Bcrypt authenticate method is used
  #which takes in an argument of the password params
  #if a user exists and the password matches, the id of the user instance is
  #stored in a session and they are logged in. 
  #otherwise, an alert to indicate invalid email and password
  #and re-renders (render "new Views")
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/welcome', notice: "Logged in!"
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end

  #destroy method
  #session with current user is saved as user id and equal to nil
  #user is redeirected to welcome page and notice shown
  def destroy
    session[:user_id] = nil
    redirect_to projects_path, notice: "Logged out!"
  end
  
  #page_requires_login method
  def page_requires_login
  end
  
  #welcome method
  def welcome
  end
end