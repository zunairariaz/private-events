class Event < ApplicationRecord
	belongs_to :creator, class_name: "User"
	has_many :event_attendings, foreign_key: :attended_event_id
	has_many :attendents, through: :event_attendings
	

	scope :upcoming, lambda { where('event_date >= ?', Date.current) }
	scope :past, lambda { where('event_date < ?', Date.current) }
end
