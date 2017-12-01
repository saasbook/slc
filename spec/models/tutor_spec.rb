require 'rails_helper'

RSpec.describe Tutor, type: :model do
   
   	describe 'valid'
   		it "is not valid without valid attributes" do
   			expect(Tutor.new).to_not be_valid
	   	end

	# describe 'associations' do
	#    	it { should have_and_belong_to_many(:time_availabilitys, as: :time_availabilityable ) }
 #    end
end
