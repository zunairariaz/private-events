class EventsController < ApplicationController
  
  def event_params
    params.require(:event).permit( :event_description, :event_date)
  end
  
  before_action :check_authentication, only: [:new, :index, :create]

  def index
    @events= Event.all
  end

  def new 
    @event = @current_user.events.new
  end

  def create    
    @event=@current_user.events.build(event_params)
    if @event.event_date.blank? || @event.event_description.blank? 
      flash.now.notice = "Both fields must be filled"
      render :new
      else
      @event.save
      redirect_to events_path
    end
  end

  def show
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
      redirect_to login_path
    end
  end
end
