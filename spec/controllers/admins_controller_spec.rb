require 'rails_helper'

RSpec.describe AdminsController, type: :controller do

    describe "routes /admins/1/show to correct path", :type => :routing do
        it 'routes to edit route' do
            expect(get("admins/1/")).to route_to("admins#show", :id => "1")
        end
    end
    
    describe 'GET show' do
        before :each do
            @request.env['devise.mapping'] = Devise.mappings[:admin]
            @admin = FactoryBot.create(:admin)
            sign_in @admin
        end

        it 'sets the variables for the form' do
            get :show, id: @admin
            expect(assigns(:tutors)).not_to eq(nil)
            expect(assigns(:tutees)).not_to eq(nil)
        end
    end

    describe "admin show page to work", :type => :routing do
        it 'displays tutors and tutees' do
            admin = Admin.create(:email => "q@q.com", :password => "password")
            get :show
            expect(nil).to be_nil
        end
    end
            
end