class TimeAvailability < ActiveRecord::Base
	has_and_belongs_to_many :time_availabilityable
	has_and_belongs_to_many :tutors
	has_and_belongs_to_many :tutees
end
