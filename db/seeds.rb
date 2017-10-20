# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

tutor1 = Tutor.new
tutor1.email = "tutor1@example.com"
tutor1.password = "tutor1"
tutor1.password_confirmation = "tutor1"

tutor2 = Tutor.new
tutor2.email = "tutor2@example.com"
tutor2.password = "tutor2"
tutor2.password_confirmation = "tutor2"

tutee1 = Tutee.new
tutee1.email = "tutee1@example.com"
tutee1.password = "tutee1"
tutee1.password_confirmation = "tutee1"
tutee1.tutor = tutor1
tutee1.save!

tutee2 = Tutee.new
tutee2.email = "tutee2@example.com"
tutee2.password = "tutee2"
tutee2.password_confirmation = "tutee2"
tutee1.tutor = tutor1
tutee2.save!

tutee3 = Tutee.new
tutee3.email = "tute3@example.com"
tutee3.password = "tutee3"
tutee3.password_confirmation = "tutee3"
tutee3.tutor = tutor2
tutee3.save!

