# Preview all emails at http://localhost:3000/rails/mailers/tutee_mailer
class TuteeMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/tutee_mailer/match_notification
  def match_notification
    TuteeMailer.match_notification
  end

end
