module EventsHelper
	require 'date'
	def event_params
	params.require(:event).permit( :event_description, :event_date)
	end
end
