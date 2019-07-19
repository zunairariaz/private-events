class SessionsController < ApplicationController

	def new
	end

	def create
		@user = User.find_by(user_name: params[:session][:user_name])
		if @user
			session[:id] = @user.id
			redirect_to @user
		else
			flash.notice = "User does not exist!"
			redirect_to signup_path
		end
	end

	def destroy
		session[:user_name] = nil         
    session[:id] = nil
  	redirect_to login_path
	end
end
