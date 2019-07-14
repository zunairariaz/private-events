class EventsController < ApplicationController
include EventsHelper
	def index
		@events= Event.all
	end

	
	def new 
		@user=User.find(session[:id])
		@event = @user.events.build
	end


	def create
		@user=User.find(session[:id])
    	@event=@user.events.build(event_params)
    	@event.save
		redirect_to events_path
	end

	
	def show
		@event=Event.find(params[:id])
	end
end
