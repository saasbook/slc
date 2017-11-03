class Tutee < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :tutor
  has_and_belongs_to_many :time_availabilitys, as: :time_availabilityable 
  
  def assign_tutor
    if self.tutor.nil?
      matched_tutor, available_tutors = nil, []
      available_tutors = find_available_tutors
      if !available_tutors.empty?
        puts "getting closer"
        matched_tutor = get_best_tutor(available_tutors)
      end
      matched_tutor
    else
      self.tutor
    end
  end
  
  private
  
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
        puts "i am hurrrr"
        available_tutors_list << tutor
      end
    end
    available_tutors_list
  end
  
end
