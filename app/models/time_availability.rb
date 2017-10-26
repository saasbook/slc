class TimeAvailability < ActiveRecord::Base
	belongs_to :time_availabilityable, polymorphic: true
	
	def ==(another_ta)
	    (self.day == another_ta.day) && (self.start_time == another_ta.start_time) && (self.end_time == another_ta.end_time)
	end
	
end
