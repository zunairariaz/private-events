class SessionsController < ApplicationController

	include SessionsHelper
	def new
	end

	def create
		@user = User.find_by(user_name: params[:session][:user_name].downcase)
		if @user
			session[:user_name]=@user.user_name
  			session[:id]=@user.id
			log_in @user
			
			redirect_to @user
		else
			flash.notice = "User does not exist!"
			redirect_to "/signup"
		end
	end


	def destroy
		session[:user_name] = nil         
    	session[:id] = nil
    	redirect_to users_path
	end
end
