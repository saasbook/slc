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
    
     describe 'fill in attributes' do
        it 'should have a filled in first and last name attribute' do
            tutor = instance_double("Tutor", :email => "apple@gmail.com", :password => "example", :password_confirmation => "example", :first_name => "Sally", :last_name => "Sue")
            expect(tutor).to have_attributes(:email => "apple@gmail.com", :password => "example", :password_confirmation => "example", :first_name => "Sally", :last_name => "Sue")
        end
    end

end
