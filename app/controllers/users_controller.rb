class UsersController < ApplicationController

	def user_params
		params.require(:user).permit(:user_name)
	end

	def index
		@users=User.all
		respond_to do |format|
      format.html # index.html.erb
			format.json { render :json => @users }
    end
	end

	def new
		@user = User.new
	end	

	def create
		@user = User.new(user_params)
		if @user.save
		redirect_to login_path
		else
		render :new	
		end
	end
	 
	def show
	 	@user = User.find(params[:id])
	 	@events=Event.all
		@upcoming_events_all = @events.upcoming
    @past_events_all = @events.past	
    @upcoming_events =  @user.attended_events.upcoming
    @past_events = @user.attended_events.past	
	 	
	 	respond_to do |format|
      format.html # index.html.erb
			format.json { render :json => @user }
    end
	end
end
