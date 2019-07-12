class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(user_name: params[:session][:user_name].downcase)
		if user
			log_in user
			redirect_to user
		else
			flash.notice = "User does not exist!"
			redirect_to "/signup"
		end
	end

	def destroy
	end

end
