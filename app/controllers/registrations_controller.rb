class RegistrationsController < Devise::RegistrationsController
  protected

  # BUGFIX
  # https://stackoverflow.com/questions/19451881/devise-after-sign-in-path-for-works-but-not-the-other-ones
  # Creating separate after_sign_up_paths for patient_user and staff_user
  # def after_sign_up_path_for(resource)
  #   # check for the class of the object to determine what type it is
  #   if resource.class == Tutor
  #     edit_tutor_path(resource)
  #   elsif resource.class == Tutee
  #     edit_tutee_path(resource)
  #   end 
  # end

end