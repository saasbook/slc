require 'rails_helper'

RSpec.describe TutorsController, type: :controller do
    

    describe "routes / to correct home path", :type => :routing do
        it 'routes to update route' do
            expect(get("/")).to route_to("pages#home")
        end
    end
    
    describe "tutee_path(@tutee) works for show", :type => :routing do
        it 'routes to show route' do
            expect(get("/tutors/1")).to route_to("tutors#show", :id => '1')
        end
    end
    
    describe "tutee_path(@tutee) works for update", :type => :routing do
        it 'routes to update route' do
            expect(patch("/tutors/1")).to route_to("tutors#update", :id => '1')
        end
    end
    
    describe "routes /tutors/1/edit to correct path", :type => :routing do
        it 'routes to edit route' do
            expect(get("tutors/1/edit/")).to route_to("tutors#edit", :id => "1")
        end
    end
    
    describe "routes /tutors/1/tutee_match to correct path", :type => :routing do
        it 'routes to tutee_match route' do
            expect(get("tutors/1/tutee_match/")).to route_to("tutors#tutee_match", :id => "1")
        end
    end
    
    describe 'fill in attributes' do
        it 'should have a filled in first and last name attribute' do
            tutor = instance_double("Tutor", :email => "apple@gmail.com", :password => "example", :password_confirmation => "example", :first_name => "Sally", :last_name => "Sue")
            expect(tutor).to have_attributes(:email => "apple@gmail.com", :password => "example", :password_confirmation => "example", :first_name => "Sally", :last_name => "Sue")
        end
    end
    
    
    describe 'invalid params should throw an error' do
        it 'should not throw an ArgumentError with no first name' do
            invalid_hash = {
               first_name: nil
            }
            expect{put :update, id: 1, tutor: invalid_hash}.not_to raise_error(ArgumentError)
        end
    end

    describe 'invalid params throwing an error' do
        it 'should not throw an ArgumentError with no last name' do
            invalid_hash = {
               first_name: "C",
               last_name: nil
            }
            expect{put :update, id: 1, tutor: invalid_hash}.not_to raise_error(ArgumentError)
        end
    end
    
    describe 'update should redirect' do

        it 'should redirect to the show view without box checked' do
            tutor = Tutor.create(:email => "email@c.com", :password => "password")
            put :update, :id => tutor.id, :tutor => { :first_name => "C", :last_name => "V", :sid => "12345", :year => "4",
            :phone_number => "123-456-7899", :major => "Computer Science", :tutor_cohort => "5", :bio => "tdrytfuygiuho", :email =>
            "hello@example.com"}
            tutor.reload
            expect(tutor.first_name).to eq("C")
            expect(tutor.last_name).to eq("V")
            expect(tutor.sid).to eq(12345)
            expect(tutor.year).to eq("4")
            expect(tutor.phone_number).to eq("123-456-7899")
            expect(tutor.major).to eq("Computer Science")
            expect(tutor.tutor_cohort).to eq("5")
            expect(tutor.bio).to eq("tdrytfuygiuho")
            expect(tutor.email).to eq("hello@example.com")
        end
    end
    
    describe 'test tutee match function' do
        it 'should say there are no available tutors' do
            tutor = Tutor.create(:email => "email@c.com", :password => "password")
            put :update, :id => tutor.id, :tutor => { :first_name => "C", :last_name => "V" }
            tutor.reload
            put :tutee_match, :id => tutor.id
            #response.should have_text("Your time availabilities do not match with any tutor. Please revise your preferences & try again.")
            expect(tutor.tutees).to eq([])
        end
    end
end
