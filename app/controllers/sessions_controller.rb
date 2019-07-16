class SessionsController < ApplicationController

	include SessionsHelper
	def new
	end

	def create
		@user = User.find_by(user_name: params[:session][:user_name])
		if @user
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
    redirect_to "/login"
	end
end
