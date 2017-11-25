class Tutor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tutees
  has_many :study_sessions
  has_and_belongs_to_many :time_availabilitys, as: :time_availabilityable 
  validates_presence_of :first_name, :last_name, :sid, :year, :email, :phone_number, :major, :tutor_cohort, :bio, :on => :update
  attr_accessor :checkbox_checked
  validates_presence_of :checkbox_checked, :on => :update
  #cattr_accessor :checkbox_checked
  
  # validate :atleast_one_is_checked

  
  # def atleast_one_is_checked
  #   errors.add(:base, "Select at least one checkbox") unless checkbox_checked
  # end

end
