class SessionsController < ApplicationController
	skip_filter :ensure_logged_in

	def new
	end

	def create
		user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
  	
  	if user
  		session[:user_id] = user.id
  		redirect_to "/users/#{user.id}", notice: "You are now logged in."
  	else
  		flash.now.alert = "invalid email or password"
  		render :new
  	end
	end

	def destroy
		session[:user_id] = nil
		redirect_to login_path, notice: "You logged out!"
	end

end