class UsersController < ApplicationController
	include UsersHelper
	def index
		@user=User.all
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
