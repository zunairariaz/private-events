class UsersController < ApplicationController
	include UsersHelper
	def user_params
		params.require(:user).permit(:user_name)
	end



	def index
		@users=User.all
	end

	def new
		@user = User.new
	end	


	def create
		@user = User.new(user_params)
		@user.save
		redirect_to "/login"	
	end
	 
	 def show
	 	@user = User.find(params[:id])
	 end
end
