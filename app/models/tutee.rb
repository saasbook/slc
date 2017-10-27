class Tutee < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :tutor
  has_and_belongs_to_many :time_availabilitys, as: :time_availabilityable 
  
  def assign_tutor
    if self.tutor.nil?
      matched_tutor, matched_tutors = nil, []
      Tutor.all.each do |tutor|
        matched_times = tutor.time_availabilitys & self.time_availabilitys # Intersection
        if !matched_times.empty?
          matched_tutors << tutor
        end
      end
      if !matched_tutors.nil?
        matched_tutors = matched_tutors.sort_by{|tutor| tutor.tutees.length}
        matched_tutor = matched_tutors[0]
        self.tutor =  matched_tutor # Assigning tutor with least existing tutees
        self.save!
        matched_tutor.tutees << self
        matched_tutor.save!
      end
      matched_tutor
    else
      self.tutor
    end
  end
end
