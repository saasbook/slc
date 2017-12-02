class Tutor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tutees
  has_many :study_sessions
  has_and_belongs_to_many :time_availabilitys, as: :time_availabilityable 
  validates_presence_of :first_name, :last_name, :sid, :year, :email, :phone_number, :major, :tutor_cohort, :bio, :on => :update


  def update_time_availabilitys(time_slot_ids)
      self.time_availabilitys = []
      if time_slot_ids != nil
          time_slot_ids.each do |id|
              time = TimeAvailability.find(id)
              self.time_availabilitys << time
          end
      end
  end

  def has_time_availability
    if self.time_availabilitys.length < 1
      errors.add(:time_availabilities, "must contain at least one time slot")
    end
  end

end
