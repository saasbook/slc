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
    
    describe 'invalid params should throw an error' do
        it 'should throw an ArgumentError with no first name' do
            invalid_hash = {
               first_name: nil
            }
            expect{put :update, id: 1, tutee: invalid_hash}.not_to raise_error(ArgumentError)
        end
    end

    describe 'invalid params throwing an error' do
        it 'should throw an ArgumentError with no last name' do
            invalid_hash = {
               first_name: "C",
               last_name: nil
            }
            expect{put :update, id: 1, tutee: invalid_hash}.not_to raise_error(ArgumentError)
        end
    end
    
    describe 'update should redirect' do

        it 'redirect to the show view' do
            tutee = Tutee.create(:email => "email@c.com", :password => "password")
            put :update, :id => tutee.id, :tutee => { :first_name => "C", :last_name => "V", :sid => "1234", 
            :grade => "sophomore", :email => "hello@berkeley.edu", :phone_number => "415-123-4567", :semesters_at_cal => "4",
                :major => "Computer Science", :requested_class => "CS61A"}
            tutee.reload
            expect(tutee.first_name).to eq("C")
            expect(tutee.last_name).to eq("V")
            expect(tutee.sid).to eq(1234)
            expect(tutee.grade).to eq("sophomore")
            expect(tutee.email).to eq("hello@berkeley.edu")
            expect(tutee.phone_number).to eq("415-123-4567")
            expect(tutee.semesters_at_cal).to eq(4)
            expect(tutee.major).to eq("Computer Science")
            expect(tutee.requested_class).to eq("CS61A")
        end
    end
    
    describe 'test tutee match function' do
        it 'should say there are no available tutors' do
            tutee = Tutee.create(:email => "email@c.com", :password => "password")
            put :update, :id => tutee.id, :tutee => { :first_name => "C", :last_name => "V", :sid => "1234", :grade => "sophomore",
            :email => "hello@berkeley.edu", :phone_number => "415-123-4567", :semesters_at_cal => "4", 
            :major => "Computer Science", :requested_class => "CS61A"}
            tutee.reload
            put :tutor_match, :id => tutee.id
            #response.should have_text("Your time availabilities do not match with any tutor. Please revise your preferences & try again.")
            expect(tutee.tutor).to eq(nil)
        end
    end
    
    describe 'test tutee match function' do
        it 'match a tutee to a tutor' do
            tutor = Tutor.create(:email => "email@c.com", :password => "password", :first_name => "C", :last_name => "V")

            tutee = Tutee.create(:email => "email@cv.com", :password => "password")
            put :update, :id => tutee.id, :tutee => { :first_name => "Con", :last_name => "Vot", :sid => "1234", :grade => "sophomore",
            :email => "hello@berkeley.edu", :phone_number => "415-123-4567", :semesters_at_cal => "4", 
            :major => "Computer Science", :requested_class => "CS61A"}

            ta = TimeAvailability.create(:day => "Monday", :start_time => "8")
            tutee.time_availabilitys << ta
            tutor.time_availabilitys << ta
            put :tutor_match, :id => tutee.id
            expect(nil).to be_nil
        end
    end
    
    # describe "Tutee is sent an email" do
    #     xit "it is not implementd" do
    #         pending("method not implemented") do
    #             email = UserMailer.create_invite('SLC@example.com',
    #                                  'tutee1@gmail.com', Time.now)
    #             assert_emails 1 do
    #                 email.deliver_now
    #             end
    #             assert_equal ['SLC@example.com'], email.from
    #             assert_equal ['tutee1@gmail.com'], email.to
    #             assert_equal 'This is a test', email.subject
    #             # for pending purposes only:
    #             true.should be(true)
    #         end
    #     end
    # end
    
    

end

