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
    
     describe 'fill in attributes' do
        it 'should have a filled in first and last name attribute' do
            tutee = instance_double("Tutee", :email => "apple@gmail.com", :password => "example", :password_confirmation => "example", :first_name => "Sally", :last_name => "Sue")
            expect(tutee).to have_attributes(:email => "apple@gmail.com", :password => "example", :password_confirmation => "example", :first_name => "Sally", :last_name => "Sue")
        end
    end
end
