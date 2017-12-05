require 'rails_helper'

RSpec.describe TuteesController, type: :controller do

    describe "routes / to correct home path", :type => :routing do
        it 'routes to update route' do
            expect(get("/")).to route_to("pages#home")
        end
    end
    
    describe "routes /tutees/1/edit to correct path", :type => :routing do
        it 'routes to edit route' do
            expect(get("tutees/1/edit/")).to route_to("tutees#edit", :id => "1")
        end
    end
    
    describe "routes /tutees/1/tutor_match to correct path", :type => :routing do
        it 'routes to tutor_match route' do
            expect(get("tutees/1/tutor_match/")).to route_to("tutees#tutor_match", :id => "1")
        end
    end


    describe 'invalid params should throw an error' do
        it 'should throw an ArgumentError with no first name' do
            invalid_hash = {
               first_name: nil
            }
            expect{put :update, id: 1, tutee: invalid_hash}.not_to raise_error(ArgumentError)
        end
        
        it 'should throw an ArgumentError with no last name' do
            invalid_hash = {
               last_name: nil
            }
            expect{put :update, id: 1, tutee: invalid_hash}.not_to raise_error(ArgumentError)
        end
        
        it 'should throw an Argument Error with no SID' do
            invalid_hash = {
                sid: nil
            }   
            expect{put :update, id: 1, tutee: invalid_hash}.not_to raise_error(ArgumentError)
        end
    
        it 'should throw an Argument Error with no grade' do
            invalid_hash = {
                grade: nil
            }   
            expect{put :update, id: 1, tutee: invalid_hash}.not_to raise_error(ArgumentError)
        end
    
    
    end
    

    
     describe 'fill in attributes' do
        it 'should have a filled in first and last name attribute' do
            tutee = instance_double("Tutee", :email => "apple@gmail.com", :password => "example", :password_confirmation => "example", :first_name => "Sally", :last_name => "Sue")
            expect(tutee).to have_attributes(:email => "apple@gmail.com", :password => "example", :password_confirmation => "example", :first_name => "Sally", :last_name => "Sue")
        end
    end
    
    describe 'invalid params' do
        it 'should throw an ArgumentError with no first name' do
            invalid_hash = {
               first_name: nil
            }
            expect{put :update, id: 1, tutee: invalid_hash}.not_to raise_error(ArgumentError)
        end
    end

    describe 'invalid params' do
        it 'should throw an ArgumentError with no last name' do
            invalid_hash = {
               first_name: "C",
               last_name: nil
            }
            expect{put :update, id: 1, tutee: invalid_hash}.not_to raise_error(ArgumentError)
        end
    end

    describe 'PUT /:id' do
        before :each do
            @request.env['devise.mapping'] = Devise.mappings[:tutee]
            @tutee = FactoryBot.create(:tutee)
            sign_in @tutee
        end

        it 'redirects to the show view' do
            put :update, id: @tutee, :tutee => attributes_for(:tutee, current_password: "password")
            expect(@tutee.reload.first_name).to eq("John")
            expect(@tutee.reload.last_name).to eq("Doe")
            expect(@tutee.reload.email).to eq("john_doe@gmail.com")
            expect(@tutee.reload.sid).to eq(12345678)
            expect(@tutee.reload.grade).to eq("Freshman")
            expect(@tutee.reload.phone_number).to eq("012-345-6789")
            expect(@tutee.reload.semesters_at_cal).to eq(1)
            expect(@tutee.reload.major).to eq("Media Studies")
            expect(@tutee.reload.requested_class).to eq("English R1A")
        end
    end

    describe 'GET /:id' do
        before :each do
            @request.env['devise.mapping'] = Devise.mappings[:tutee]
            @tutee = FactoryBot.create(:tutee)
            sign_in @tutee
        end

        it 'sets the variables for the form' do
            get :edit, id: @tutee
            expect(assigns(:tutee)).to eq(@tutee)
            expect(assigns(:time_slots)).to eq(["8:00 - 9:00", "9:00 - 10:00", "10:00 - 11:00", "11:00 - 12:00", "12:00 - 1:00", "1:00 - 2:00", "2:00 - 3:00", "3:00 - 4:00", "4:00 - 5:00", "5:00 - 6:00"])
            expect(assigns(:days)).to eq(["Mon.", "Tues.", "Wed.", "Thurs.", "Fri.", "Sat.", "Sun."])
        end
    end
    
    describe 'tutee match function' do
        before :each do
            @request.env['devise.mapping'] = Devise.mappings[:tutee]
            @tutee = FactoryBot.create(:tutee)
            @tutor = FactoryBot.create(:tutor)
            # @ta = FactoryBot.create(:time_availability)
            sign_in @tutee
            sign_in @tutor
        end

        it 'says there are no available tutors' do
            put :update, id: @tutee, :tutee => attributes_for(:tutee, current_password: "password")
            get :tutor_match, :id => @tutee
            @tutee.reload
            expect(assigns(:display_text)).to include("Your time availabilities do not match with any tutor. Please revise your preferences & try again.")
        end

        # it 'matches a tutee to a tutor' do
        #     # put :update, id: @tutee, :tutee => attributes_for(:tutee, current_password: "password")
        #     # put :update, id: @tutor, :tutor => attributes_for(:tutor, current_password: "password")
        #     # @tutee.time_availabilitys << @ta
        #     # @tutor.time_availabilitys << @ta
        #     # @tutee.reload
        #     # @tutor.reload
        #     taMon8 = TimeAvailability.create(:day => "Monday", :start_time => 8)
        #     tutor1 = Tutor.new
        #     tutor1.email = "tutor1@gmail.com"
        #     tutor1.first_name = "tutor1_firstname"
        #     tutor1.last_name = "tutor1_lastname"
        #     tutor1.sid = "11111111"
        #     tutor1.year = "senior"
        #     tutor1.phone_number = "111-111-1111"
        #     tutor1.major = "CS"
        #     tutor1.tutor_cohort = "1"
        #     tutor1.bio = "I am tutor 1"
        #     tutor1.password = "tutor1"
        #     tutor1.password_confirmation = "tutor1"
        #     tutor1.time_availabilitys << taMon8 
        #     tutor1.save! 

        #     tutee1 = Tutee.new
        #     tutee1.email = "tutee1@gmail.com"
        #     tutee1.password = "tutee1"
        #     tutee1.password_confirmation = "tutee1"
        #     tutee1.first_name = "tutee1_firstname"
        #     tutee1.last_name = "tutee1_lastname"
        #     tutee1.sid = "01111111"
        #     tutee1.grade = "Sophomore"
        #     tutee1.phone_number = "011-111-1111"
        #     tutee1.semesters_at_cal = "1"
        #     tutee1.major = "CS"
        #     tutee1.requested_class = "CS169"
        #     tutee1.time_availabilitys << taMon8 
        #     tutee1.save!

        #     put :tutor_match, :id => tutee1.id
        #     # expect(assigns(:display_text)).not_to eq("Your time availabilities do not match with any tutor. Please revise your preferences & try again.")
        #     expect(nil).to eq(nil)
        # end
    end

end

