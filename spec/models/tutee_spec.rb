require 'rails_helper'

RSpec.describe Tutee, type: :model do

 
    describe "routes /tutees/1/edit to correct path", :type => :routing do
        it 'routes to edit route' do
            expect(get("tutees/1/edit")).to route_to("tutees#edit")
        end
    end
    
    describe "retrieve correctly", :type => :controller do 
        it 'sets @tutee correctly' do 
            tutee = instance_double('Tutee')
            expect(Tutee).to receive(:find).with("1").and_return(tutee)
        end
    end
    
     describe 'fill in attributes' do
        it 'should have a filled in first and last name attribute' do
            tutee = instance_double("Tutee", :email => "apple@gmail.com", :first_name => "Sally", :last_name => "Sue")
            expect(tutee).to have_attributes(:email => "apple@gmail.com", :first_name => "Sally", :last_name => "Sue")
        end
    end
  
  
end
