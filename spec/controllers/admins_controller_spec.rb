require 'rails_helper'

RSpec.describe AdminsController, type: :controller do

    describe "routes /admins/1/show to correct path", :type => :routing do
        it 'routes to edit route' do
            expect(get("admins/1/")).to route_to("admins#show", :id => "1")
        end
    end
end