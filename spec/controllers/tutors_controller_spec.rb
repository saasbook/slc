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
    
    describe 'PUT /:id' do
        before :each do
            @request.env['devise.mapping'] = Devise.mappings[:tutor]
            @tutor = FactoryBot.create(:tutor)
            sign_in @tutor
        end

        it 'redirects to the show view' do
            put :update, id: @tutor, :tutor => attributes_for(:tutor, current_password: "password")
            expect(@tutor.reload.first_name).to eq("Bob")
            expect(@tutor.reload.last_name).to eq("Ross")
            expect(@tutor.reload.email).to eq("bob_ross@gmail.com")
            expect(@tutor.reload.sid).to eq(87654321)
            expect(@tutor.reload.year).to eq("Senior")
            expect(@tutor.reload.phone_number).to eq("987-654-3210")
            expect(@tutor.reload.major).to eq("Haas")
            expect(@tutor.reload.bio).to eq("I am Bob Ross")
        end
    end
    
    describe 'tutee match function' do
        before :each do
            @request.env['devise.mapping'] = Devise.mappings[:tutor]
            @tutor = FactoryBot.create(:tutor)
            sign_in @tutor
        end

        it 'says there are no available tutors' do
            put :tutee_match, :id => @tutor
            expect(@tutor.tutees).to eq([])
        end
    end
end
