module EventsHelper
	require 'date'
	def event_params
	event_date = DateTime.now.strftime("%d/%m/%Y %H:%M")
	params.require(:event).permit(:event_name, :event_description, :event_date)
	end
end
