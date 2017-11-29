class Tutor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tutees
  has_many :study_sessions
  has_and_belongs_to_many :time_availabilitys, as: :time_availabilityable 
  attr_accessor :tutor_items
  #validates_presence_of :first_name, :last_name, :sid, :year, :email, :phone_number, :major, :tutor_cohort, :bio, :on => :update
end
