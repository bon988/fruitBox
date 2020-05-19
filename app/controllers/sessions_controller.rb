class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]
  
  #new method
  def new
  end
  
  def login
  end

  #create method
  #repsonsible for finding a user instance based on the email params provided by the form
  #if elese statement: to check if the password is a match, Bcrypt authenticate method is used
  #which takes in an argument of the password params
  #if a user exists and the password matches, the id of the user instance is
  #stored in a session and they are logged in. 
  #otherwise (else) the user will be given an alert to indicate invalid email and password is invalid 
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
  def destroy
    session[:user_id] = nil
    redirect_to projects_path, notice: "Logged out!"
  end
  
  def page_requires_login
  end
  
  def welcome
  end

  
end