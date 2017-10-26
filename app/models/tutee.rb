class Tutee < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :tutor
  has_many :time_availabilitys, as: :time_availabilityable 
  
  def get_tutor_match
    matched_tutors = []
    Tutor.all.each do |tutor|
      matched_times = tutor.availabilitys & self.time_availabilitys # Intersection
      if !matched_times.nil?
        matched_tutors << tutor
      end
    end
    if !matched_tutors.nil?
      matched_tutors.sort_by{|tutor| tutor.tutees.count}
      self.tutor = matched_tutors[0] # Assigning tutor with least existing tutees
    end  
  end
end
