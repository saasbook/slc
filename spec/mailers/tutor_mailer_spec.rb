require "rails_helper"

RSpec.describe TutorMailer, type: :mailer do
  describe "match_notification" do
        it "should send an email to tutor" do
            tutor = instance_double('Tutor')
            allow(tutor).to receive(:first_name).and_return('tutor1_firstname')
            allow(tutor).to receive(:last_name).and_return('tutor1_lastname')
            allow(tutor).to receive(:password).and_return('tutor1')
            allow(tutor).to receive(:email).and_return('tutor1@gmail.com')
            
            tutee = instance_double('Tutee')
            allow(tutee).to receive(:first_name).and_return('tutee1_firstname')
            allow(tutee).to receive(:last_name).and_return('tutee1_lastname')
            allow(tutee).to receive(:password).and_return('tutee1')
            allow(tutee).to receive(:email).and_return('tutee1@gmail.com')
            allow(tutee).to receive(:phone_number).and_return('9413026027')
            
            times = instance_double('TimeAvailability', :day => "Monday", :start_time => 8)
            
            email = TutorMailer.match_notification(tutee, tutor, times)
            assert_emails 1 do
                email.deliver_now
            end
            assert_equal ['slc.tutoring.noreply@gmail.com'], email.from
            assert_equal ['tutor1@gmail.com'], email.to
            assert_equal 'SLC Tutee Assignment', email.subject
        end
    end
end
