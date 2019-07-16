class EventsController < ApplicationController
  
  def event_params
  params.require(:event).permit( :event_description, :event_date)
  end
	
  before_action :check_authentication, only: [:new, :index, :show, :create]

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
    	if @event.event_date.blank? || @event.event_description.blank? 
    	flash.now.notice = "Both fields must be filled"
    	render :new

    	else
    	@event.save
			redirect_to events_path
			end
	end

	def show
		@user=User.find(session[:id])
		@event=Event.find(params[:id])
		@attendents=@event.attendents
	end

	def attend
		@event=Event.find(params[:event_id])
    @attendent= @event.event_attendings.find_or_create_by(attendent_id: session[:id])
    @attendent.save
    redirect_to events_path
	end

	def check_authentication
		if session[:id] == nil
			flash.now.notice ='Please login your account first!'
			redirect_to '/login'
		end
	end
end
