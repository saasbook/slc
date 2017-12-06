require 'rails_helper'

RSpec.describe Tutor, type: :model do
   
   it "is not valid without valid attributes" do
    expect(Tutor.new).to_not be_valid
    end
    
    # it { should have_many(:tutees) }
    
end
