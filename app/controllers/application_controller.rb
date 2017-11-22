class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def after_sign_in_path_for(resource)
    # check for the class of the object to determine what type it is
    if resource.class == Tutor
      tutee_match_path(resource)
    elsif resource.class == Tutee
      tutor_match_path(resource)
    elsif resource.class == Admin
      admin_path(resource)
    end
  end
  
  def redirect_to_correct_edit_form(model, model_sym)
    if(model_sym == :tutee)
      redirect_to edit_tutee_path(model) and return
    else
      redirect_to edit_tutor_path(model) and return
    end  
  end  
  
  
end
