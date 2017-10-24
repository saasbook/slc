# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

tutor1 = Tutor.new
tutor1.email = "tutor1@example.com"
tutor1.name = "tutor1_name"
tutor1.password = "tutor1"
tutor1.password_confirmation = "tutor1"

tutor2 = Tutor.new
tutor2.email = "tutor2@example.com"
tutor2.name = "tutor2_name"
tutor2.password = "tutor2"
tutor2.password_confirmation = "tutor2"

tutor3 = Tutor.new
tutor3.email = "tutor3@example.com"
tutor3.name = "tutor3_name"
tutor3.password = "tutor3"
tutor3.password_confirmation = "tutor3"

tutor4 = Tutor.new
tutor4.email = "tutor4@example.com"
tutor4.name = "tutor4_name"
tutor4.password = "tutor4"
tutor4.password_confirmation = "tutor4"

######################################

tutee1 = Tutee.new
tutee1.email = "tutee1@example.com"
tutee1.password = "tutee1"
tutee1.password_confirmation = "tutee1"
tutee1.first_name = "tutee1_firstname"
tutee1.last_name = "tutee1_lastname"
tutee1.tutor = tutor1
tutee1.save!

tutee2 = Tutee.new
tutee2.email = "tutee2@example.com"
tutee2.password = "tutee2"
tutee2.password_confirmation = "tutee2"
tutee2.first_name = "tutee2_firstname"
tutee2.last_name = "tutee2_lastname"
tutee2.tutor = tutor1
tutee2.save!

tutee3 = Tutee.new
tutee3.email = "tute3@example.com"
tutee3.password = "tutee3"
tutee3.password_confirmation = "tutee3"
tutee3.first_name = "tutee3_firstname"
tutee3.last_name = "tutee3_lastname"
tutee3.tutor = tutor2
tutee3.save!

tutee4 = Tutee.new
tutee4.email = "tut43@example.com"
tutee4.password = "tutee4"
tutee4.password_confirmation = "tutee4"
tutee4.first_name = "tutee4_firstname"
tutee4.last_name = "tutee4_lastname"
tutee4.tutor = tutor3
tutee4.save!

