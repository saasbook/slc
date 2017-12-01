require 'rails_helper'

RSpec.describe Tutee, type: :model do
	describe 'assign session' do
		before :each do
            # # @request.env['devise.mapping'] = Devise.mappings[:tutee]
            # @tutee = Tutee.create()
            # # sign_in @tutee

            # # @request.env['devise.mapping'] = Devise.mappings[:tutor]
            # @tutor = FactoryBot.create(
            # # sign_in @tutor

            @taMon8 = TimeAvailability.create(:day => "Monday", :start_time => 8)
            @taMon9 = TimeAvailability.create(:day => "Monday", :start_time => 9)

            @tutor = Tutor.create(email: "tutor@gmail.com", first_name: "John", last_name: "Doe", sid: "11111111",
            	year: "senior", phone_number: "111-111-1111", major: "CS", tutor_cohort: "1", bio: "I am a tutor", password: "password",
            	password_confirmation: "password", time_availabilitys: [@taMon8, @taMon9])

            @tutee = Tutee.create(email: "tutee@gmail.com", first_name: "Joe", last_name: "Smith", sid: "22222222",
            	grade: "senior", phone_number: "222-222-2222", major: "CS", password: "password",
            	password_confirmation: "password", requested_class: "CS169", semesters_at_cal: "1", time_availabilitys: [@taMon8, @taMon9])
        end

		it 'assigns a session' do
			@tutee.assign_tutor_and_session
		end
	end	

	# describe 'associations' do
	# 	it { should have_and_belong_to_many(:time_availabilitys, as: :time_availabilityable ) }
	# end
end
