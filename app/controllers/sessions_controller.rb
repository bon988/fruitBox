class SessionsController < ApplicationController
  #new method
  def new
  end

  #create method
  #if else statment to authenticate a user by password and email
  #and user id. session stores the user id and is also used to authenticate
  #else user will be given an alert to indicate invalid input 
  #and re-renders (render "new")
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to projects_path, notice: "Logged in!"
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
end
