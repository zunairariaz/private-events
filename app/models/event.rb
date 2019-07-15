class Event < ApplicationRecord
	belongs_to :creator, class_name: "User"

	has_many :attendents, through :event_attendings
	has_many :event_attendings, foreign_key: attended_event_id
end