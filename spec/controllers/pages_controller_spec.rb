require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  before (:each) do
    @tutee = Tutee.create(:email => "c@v.com", :password => "password")
    @tutor = Tutor.create(:email => "v@c.com", :password => "password")
  end

  describe "After sigin-in" do
    it "redirects to the /tutee page" do
        controller.after_sign_in_path_for(@tutee).should == "/tutees/#{@tutee.id}"
    end
    
    it "redirects to the /tutor page" do
        controller.after_sign_in_path_for(@tutor).should == "/tutors/#{@tutee.id}"
    end

  end
end
