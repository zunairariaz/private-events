class User < ApplicationRecord
	validates :user_name, presence: true, uniqueness: { case_sensitive: false }
	has_many :events ,foreign_key: :creator_id,
	dependent: :destroy

	has_many :attended_events, through :event_attending
	has_many :event_attendings , foreign_key: :attendent_id



end