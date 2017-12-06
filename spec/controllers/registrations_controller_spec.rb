require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do

  before (:each) do
    @tutee = Tutee.create(:email => "c@v.com", :password => "password")
    @tutor = Tutor.create(:email => "v@c.com", :password => "password")
    @admin = Admin.create(:email => "q@v.com", :password => "password")
  end

  describe "After registration" do
    it "redirects to the admin show page after registration" do
        controller.after_sign_up_path_for(@admin).should == "/admins/#{@admin.id}"
    end
  end
end