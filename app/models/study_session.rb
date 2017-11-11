class StudySession < ActiveRecord::Base
	has_one :time_availability
	has_one :tutor
	has_one :tutee
end
