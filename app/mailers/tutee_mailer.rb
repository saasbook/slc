class TuteeMailer < ApplicationMailer
  default from: "jttruitt95@gmail.com"

  def match_notification(tutee, tutor)
    @tutor = tutor
    @tutee = tutee
    @greeting = "Hi"

    mail to: tutee.email, subject: "SLC Tutor Confirmation"
  end
end
