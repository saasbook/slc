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
        if @tutor.save
            flash[:notice] = "Form for #{@tutor.first_name + ' ' + @tutor.last_name} was succesfully created"
            redirect_to tutee_match_path(@tutor)
        else 
            flash[:error] = "Please ensure you have selected at least one time slot"
            redirect_to edit_tutor_path(@tutor)
        end
    end
    
    def destroy
    end
    
    def tutor_params
        params.require(:tutor).permit(:first_name, :last_name, :sid, :year, :email, :phone_number, :major, :tutor_cohort, :bio)
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
    
  #Getter method for if checkbox items checked
  def checkbox_checked
      @checkbox_checked = @time_availabilitys_ids
  end

end



