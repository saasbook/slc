require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  before (:each) do
    @tutee = Tutee.create(:email => "c@v.com", :password => "password")
    @tutor = Tutor.create(:email => "v@c.com", :password => "password")
    @admin = Admin.create(:email => "q@v.com", :password => "password")
  end

  describe "After sigin-in" do
    it "redirects to the tutor match page" do
        controller.after_sign_in_path_for(@tutee).should == "/tutees/#{@tutee.id}/tutor_match"
    end
    
    it "redirects to the tutee match page" do
        controller.after_sign_in_path_for(@tutor).should == "/tutors/#{@tutee.id}/tutee_match"
    end

    it "redirects to the admin show page" do
        controller.after_sign_in_path_for(@admin).should == "/admins/#{@admin.id}"
    end
    
  end
end
