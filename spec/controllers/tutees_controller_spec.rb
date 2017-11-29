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
        it 'updates attributes and redirects to the tutor_match view' do
            @tutee = create(:tutee)
            expect(@tutee.first_name).to eq("John")
            put :update, :id => @tutee.id, :tutee => { :first_name => "Joe", :password => "password", :password_confirmation => "password"}
            @tutee.reload
            expect(@tutee.first_name).to eq("Joe")
            expect(response).to redirect_to(tutor_match_path)
        end
    end
    
    describe 'tutee match function' do
        it 'matches a tutee to a tutor' do
            tutor = create(:tutor)
            tutee = create(:tutee)
            ta = create(:time_availability)
            tutee.time_availabilitys << ta
            tutor.time_availabilitys << ta
            get :tutor_match, :id => tutee.id
            expect(response).to redirect_to(tutor_match_path(tutee.id))
        end
    end

end

