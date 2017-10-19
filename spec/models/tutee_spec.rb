require 'rails_helper'

RSpec.describe Tutee, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  
 
    describe "routes /tutees/new to correct path", :type => :routing do
        it 'routes to new route' do
            expect(post("tutees/new")).to route_to("tutees#new")
        end
    end
    
    describe "create will make a new tutee", :type => :controller do 
        let(:tutee_params) {{:tutee => {:first_name => "Chiquita", :last_name => "Banana", :sid => "1234", 
        :grade => "Freshman", :email => "123@gmail.com", :phone_number, => "123-4567", :semesters_at_cal => "4", 
        :major => "Biology",:requested_course => "CS61A", :if_dsp => "yes", :times_available => "1-2",
        :days_available => "Tuesday"}}}
        
        #Where is the error?
        
        it "creates a tutee" do
            expect { post :create, tutee_params}.to change(Tutee, :count).by(1)
        end
    end
    
    describe "retrieve corerctly", :type => :controller do 
        it 'sets @tutee correctly' do 
            tutee = instance_double('Tutee')
            expect(Tutee).to receive(:find).with("1").and_return(tutee)
        end
    end
    
     describe 'fill in email' do
        it 'should have a filled email attribute' do
            tutee = instance_double("Tutee", :email => "apple@gmail.com")
            expect(tutee).to have_attributes(:email => "apple@gmail.com")
        end
    end
  
  
end
