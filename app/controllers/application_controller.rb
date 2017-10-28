class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def after_sign_in_path_for(resource)
    # check for the class of the object to determine what type it is
   if resource.class == Tutor
      tutor_path(resource)
    elsif resource.class == Tutee
      tutee_path(resource)
    end
  end
  
end
