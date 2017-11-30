class Tutee < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :tutor
  has_and_belongs_to_many :time_availabilitys, as: :time_availabilityable 
  has_one :study_session
  validates_presence_of :first_name, :last_name, :sid, :grade, :email, :phone_number, :semesters_at_cal, :major, :requested_class, :on => :update
  validate :has_time_availability, :on => :update

  def assign_tutor_and_session
    if self.tutor.nil?
      matched_tutor, available_tutors = nil, []
      
      available_tutors = find_available_tutors
      if !available_tutors.empty?
        matched_tutor = get_best_tutor(available_tutors)
        assign_session(matched_tutor)
      end
      matched_tutor
    else
      self.tutor
    end
  end

  def update_time_availabilitys(time_slot_ids)
      self.time_availabilitys = []
      if time_slot_ids != nil
          time_slot_ids.each do |id|
              time = TimeAvailability.find(id)
              self.time_availabilitys << time
          end
      end
  end
  
  private
  
  def assign_session(matched_tutor)
    matched_times = matched_tutor.time_availabilitys & self.time_availabilitys
    booked_time_availability = matched_times[0]
    my_study_session = StudySession.create(:tutor_id => matched_tutor.id, :tutee_id => self.id, :time_availability_id => booked_time_availability.id)
    my_study_session.time_availabilitys << booked_time_availability
    my_study_session.tutor = matched_tutor
    my_study_session.tutee = self
    my_study_session.save!
    self.study_session = my_study_session
    self.time_availabilitys.delete(booked_time_availability) 
    self.save!
    matched_tutor.time_availabilitys.delete(booked_time_availability) # Remove availability since study session booked
    matched_tutor.study_sessions << my_study_session
    matched_tutor.save!
  end
  
  def get_best_tutor(available_tutors_list)
    available_tutors_list = available_tutors_list.sort_by{|tutor| tutor.tutees.length}
    best_tutor = available_tutors_list[0]
    self.tutor =  best_tutor # Assigning tutor with least existing tutees
    self.save!
    best_tutor.tutees << self
    best_tutor.save!
    best_tutor
  end
  
  def find_available_tutors
    available_tutors_list = []
    Tutor.all.each do |tutor|
      matched_times = tutor.time_availabilitys & self.time_availabilitys # Intersection
      if !matched_times.empty?
        available_tutors_list << tutor
      end
    end
    available_tutors_list
  end
<<<<<<< HEAD
=======

  def has_time_availability
    if self.time_availabilitys.length < 1
      errors.add(:time_availabilities, "must contain at least one time slot")
    end
  end

>>>>>>> 8c94b03c602ca9da08345b3d1f339903be70ea00
end
