class StudySession < ActiveRecord::Base
	has_and_belongs_to_many :time_availabilitys, as: :time_availabilityable 
	has_one :tutor
	has_one :tutee
end
