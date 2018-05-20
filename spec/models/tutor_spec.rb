require 'rails_helper'

RSpec.describe Tutor, type: :model do
   
   	describe 'valid'
   		it "is not valid without valid attributes" do
   			expect(Tutor.new).to_not be_valid
	   	end

 
	describe 'check waitlist funcitonality' do
      before :each do
        
            @taMon8 = TimeAvailability.create(:day => "Monday", :start_time => 8)
            @taMon9 = TimeAvailability.create(:day => "Monday", :start_time => 9)

            @tutor = Tutor.create(email: "tutor@gmail.com", first_name: "John", last_name: "Doe", sid: "11111111",
            	year: "senior", phone_number: "111-111-1111", major: "CS", tutor_cohort: "1", bio: "I am a tutor", password: "password",
            	password_confirmation: "password", time_availabilitys: [@taMon8, @taMon9])

            @tutee = Tutee.create(email: "tutee@gmail.com", first_name: "Joe", last_name: "Smith", sid: "22222222",
            	grade: "senior", phone_number: "222-222-2222", major: "CS", password: "password",
            	password_confirmation: "password", requested_class: "CS169", semesters_at_cal: "1", time_availabilitys: [@taMon8, @taMon9])
    
       end
       
       	it "is valid with valid attributes" do
   			expect(@tutor).to be_valid
	   	end
	   	
	   	
      end
        
end
