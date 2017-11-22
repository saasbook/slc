class TutorsController < ApplicationController

    before_action :validate_params, only: [:update]
   
    def validate_params
        @tutor = Tutor.find(params[:id])
        begin
            if params[:tutor][:first_name] == nil || params[:tutor][:first_name].length == 0
                    throw ArgumentError
            elsif params[:tutor][:last_name] == nil || params[:tutor][:last_name].length == 0
                    throw ArgumentError 
            elsif params[:tutor][:sid] == nil || params[:tutor][:sid].length == 0
                    throw ArgumentError    
            elsif params[:tutor][:year] == nil || params[:tutor][:year].length == 0
                    throw ArgumentError 
            elsif params[:tutor][:email] == nil || params[:tutor][:email].length == 0 
                    throw ArgumentError         
            elsif params[:tutor][:phone_number] == nil || params[:tutor][:phone_number].length == 0
                    throw ArgumentError    
            elsif params[:tutor][:major] == nil || params[:tutor][:major].length == 0
                    throw ArgumentError    
            elsif params[:tutor][:tutor_cohort] == nil || params[:tutor][:tutor_cohort].length == 0
                    throw ArgumentError 
            elsif params[:tutor][:bio] == nil || params[:tutor][:bio].length == 0
                    throw ArgumentError
            end
        rescue ArgumentError => e
            flash[:error] = e.message
            redirect_to edit_tutor_path(@tutor) 
        end
    end
   

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


