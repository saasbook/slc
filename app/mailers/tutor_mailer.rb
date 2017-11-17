class TutorMailer < ApplicationMailer
  default from: "slc.tutoring.noreply@gmail.com"

  def match_notification(tutee, tutor, time_availability)
    @time_availability = time_availability
    @day = time_availability.day
    @time = time_availability.start_time.to_s + " " + am_or_pm
    @tutor = tutor
    @tutee = tutee
    @greeting = "Hi"

    mail to: tutor.email, subject: "SLC Tutee Assignment"
  end
  
  def am_or_pm
    (@time_availability.start_time < 6 || @time_availability.start_time == 12) ? "pm" : "am"
  end
end
