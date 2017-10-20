class TimeAvailability < ActiveRecord::Base
	belongs_to :time_availabilityable, polymorphic: true
end
