class TutorsController < ApplicationController

    before_action :validate_params, only: [:update]
    
    def after_sign_in_path_for(tutor)
        stored_location_for(tutor) || root
    end
    def validate_params
        if params[:tutor][:name] == nil || params[:tutor][:name].length == 0
                throw ArgumentError
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
        @tutor = Tutor.find(params[:id])
        @tutor.update_attributes!(tutor_params)
        flash[:notice] = "Form for #{@tutor.name} was succesfully created"
        redirect_to tutor_path(@tutor)
    end
    
    def destroy
    end
    
    def tutor_params
        params.require(:tutor).permit(:name, :sid, :year, :email, :phone_number, :major, :tutor_cohort, :bio)
    end

end

