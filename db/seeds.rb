# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#ta1 = TimeAvailability.create(:day => "Monday", :start_time => 8)
#ta2 = TimeAvailability.create(:day => "Monday", :start_time => 9)
#ta3 = TimeAvailability.create(:day => "Monday", :start_time => 10)

###########################################

tutor1 = Tutor.new
tutor1.email = "tutor1@gmail.com"
tutor1.first_name = "tutor1"
tutor1.last_name = "name"
tutor1.password = "tutor1"
tutor1.password_confirmation = "tutor1"
tutor1.time_availabilitys.build(:day => "Wednesday", :start_time =>8)
tutor1.time_availabilitys.build(:day => "Wednesday", :start_time =>9)
tutor1.save! 

tutor2 = Tutor.new
tutor2.email = "tutor2@gmail.com"
tutor2.first_name = "tutor2"
tutor2.last_name = "name"
tutor2.password = "tutor2"
tutor2.password_confirmation = "tutor2"
tutor2.time_availabilitys.build(:day => "Thursday", :start_time =>8)
tutor2.time_availabilitys.build(:day => "Thursday", :start_time =>10)
tutor2.save!

tutor3 = Tutor.new
tutor3.email = "tutor3@gmail.com"
tutor3.first_name = "tutor3"
tutor3.last_name = "name"
tutor3.password = "tutor3"
tutor3.password_confirmation = "tutor3"
tutor3.time_availabilitys.build(:day => "Thursday", :start_time =>8)
tutor3.time_availabilitys.build(:day => "Thursday", :start_time =>10)
tutor3.save! 

tutor4 = Tutor.new
tutor4.email = "tutor4@gmail.com"
tutor4.first_name = "tutor"
tutor4.last_name = "name"
tutor4.password = "tutor4"
tutor4.password_confirmation = "tutor4"
# tutor4.time_availabilitys.build(:day => "Thursday", :start_time => time5, :end_time => time6)
# tutor4.time_availabilitys.build(:day => "Friday", :start_time => time11, :end_time => time12)
tutor4.save! 

######################################

#Available to be matched with Tutors 1 and 2
#Should be matched to Tutor 1
tutee1 = Tutee.new
tutee1.email = "tutee1@gmail.com"
tutee1.password = "tutee1"
tutee1.password_confirmation = "tutee1"
tutee1.first_name = "tutee1_firstname"
tutee1.last_name = "tutee1_lastname"
tutee1.time_availabilitys.build(:day => "Wednesday", :start_time =>8)
tutee1.save!

#Available to be matched with Tutors 1 and 3
#Should be matched to Tutor 3
tutee2 = Tutee.new
tutee2.email = "tutee2@gmail.com"
tutee2.password = "tutee2"
tutee2.password_confirmation = "tutee2"
tutee2.first_name = "tutee2_firstname"
tutee2.last_name = "tutee2_lastname"
# tutee2.time_availabilitys.build(:day => "Wednesday", :start_time => time1, :end_time => time2)
# tutee2.time_availabilitys.build(:day => "Friday", :start_time => time9, :end_time => time10)
tutee2.save!

#Available to be matched with Tutors 1 and 3
#Should be matched to Tutor 1
tutee3 = Tutee.new
tutee3.email = "tutee3@gmail.com"
tutee3.password = "tutee3"
tutee3.password_confirmation = "tutee3"
tutee3.first_name = "tutee3_firstname"
tutee3.last_name = "tutee3_lastname"
# tutee3.time_availabilitys.build(:day => "Wednesday", :start_time => time1, :end_time => time2)
# tutee3.time_availabilitys.build(:day => "Friday", :start_time => time9, :end_time => time10)
tutee3.save!

#Available to be matched with Tutors 1, 2 and 4
#Should be matched to Tutor 2
tutee4 = Tutee.new
tutee4.email = "tutee4@gmail.com"
tutee4.password = "tutee4"
tutee4.password_confirmation = "tutee4"
tutee4.first_name = "tutee4_firstname"
tutee4.last_name = "tutee4_lastname"
# tutee4.time_availabilitys.build(:day => "Wednesday", :start_time => time3, :end_time => time4)
# tutee4.time_availabilitys.build(:day => "Friday", :start_time => time11, :end_time => time12)
tutee4.save!

