class EventsController < ApplicationController
include EventsHelper
	def index
		@events= Event.all
		@user = User.find(session[:id])
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
		@attendents=@event.attendents
	end

	def event_attend
		@event=Event.find(params[:attended_event_id])
        @attendent= @event.event_attendings.new(attendent_id: params[:id])
        @attendent.save
	end
end
