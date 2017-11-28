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
    end

    #Update all of the attributes gathered from edit form
    def update
        begin
            @time_availabilitys_ids = params[:tutor][:time_availabilitys_ids]
            @tutor = Tutor.find(params[:id])
            @tutor.update_attributes!(tutor_params)
            @tutor.time_availabilitys.destroy_all
            if @time_availabilitys_ids != nil
                @time_availabilitys_ids.each do |id|
                    time = TimeAvailability.find(id)
                    @tutor.time_availabilitys << time
                end
            end
            flash[:notice] = "Form for #{@tutor.first_name + ' ' + @tutor.last_name} was succesfully created"
            redirect_to tutee_match_path(@tutor)
        rescue ActiveRecord::RecordInvalid => invalid   
            flash[:error] = invalid.record.errors
            redirect_to edit_tutor_path(@tutor)
        end    
    end
    
    def destroy
    end
    
    def tutor_params
        params.require(:tutor).permit(:first_name, :last_name, :sid, :year, :email, :phone_number, :major, :tutor_cohort, :bio)
    end
    
    def tutee_match
      @tutor = Tutor.find(params[:id])
      @tutees = @tutor.tutees
      if @tutees.empty?
          @display_text = "You have not been assigned any students yet."
      end
    end

end


