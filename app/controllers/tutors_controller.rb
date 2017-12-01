class TutorsController < ApplicationController

    def show
    end
    
    def index
        #Should there be anything here?
    end

    def create
    end
    
    def new
       #Empty - something here?
    end
    
    #Display form for tutor to enter in attributes
    def edit
        @tutor = Tutor.find(params[:id])
        @time_slots = ["8 - 9", "9 - 10", "10 - 11", "11 - 12", "12 - 1", "1 - 2", "2 - 3", "3 - 4", "4 - 5", "5 - 6"]
        @days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    end

    #Update all of the attributes gathered from edit form
    def update
        @tutor = Tutor.find(params[:id])
        @tutor.update_attributes(tutor_params)
        time_slot_ids = params[:tutor][:time_availabilitys_ids]
        @tutor.update_time_availabilitys(time_slot_ids)
        session[:form_submitted] = true
        if at_least_one_time_availability? && @tutor.save
            flash[:notice] = "Form for #{@tutor.first_name + ' ' + @tutor.last_name} was succesfully created"
            redirect_to tutor_match_path(@tutor)
        elsif at_least_one_time_availability? 
            flash[:error] = @tutor.full_messages.first
            redirect_to edit_tutor_path(@tutor)
        else
            flash[:error] = "Must check at least one time availability"
            redirect_to edit_tutee_path
        end
    end
    
    def destroy
    end

    
    
    def tutee_match
      if (tutor_signed_in?)
          if(current_tutor.id.to_s != params[:id]) 
            params[:id] = current_tutor.id.to_s
            redirect_to tutee_match_path(current_tutor)
          end
      end
      @tutor = Tutor.find(params[:id])
      @tutees = @tutor.tutees
      if @tutees.empty?
          @display_text = "You have not been assigned any students yet."
      end
    end

  private
    
  def tutor_params
    params.require(:tutor).permit(:first_name, :last_name, :sid, :year, :email, :phone_number, :major, :tutor_cohort, :bio)
  end

  def at_least_one_time_availability?
    params[:tutor][:time_availabilitys_ids] != nil
  end

end



