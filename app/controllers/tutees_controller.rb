class TuteesController < ApplicationController

    before_action :validate_params, only: [:update]
    
    def after_sign_in_path_for(tutee)
        stored_location_for(tutee) || root
    end

    
    
    def validate_params
        if params[:tutee][:first_name] == nil || params[:tutee][:first_name].length == 0
                throw ArgumentError
        elsif params[:tutee][:last_name] == nil || params[:tutee][:last_name].length == 0
                throw ArgumentError        
        end
    end
    

    def show
    end
    
    def index
        #Should there be anything here?
    end

    #Not sure?
    def create
        #@tutee = Tutee.new(tutee_params)
    end
    
    def new
       #Empty - something here?
    end
    
    #Display form for tutee to enter in attributes
    def edit
        @tutee = Tutee.find(params[:id])
    end

    #Update all of the attributes gathered from edit form
    def update
        @tutee = Tutee.find(params[:id])
        @tutee.update_attributes!(tutee_params)
        flash[:notice] = "Form for #{@tutee.first_name + ' ' + @tutee.last_name} was succesfully created"
        redirect_to tutee_path(@tutee)
    end
    
    def destroy
    end
    
    def tutor_match
        @tutee = Tutee.find(params[:id])
        @tutor = @tutee.tutor
        if !@tutor.nil?
            @display_text = "#{@tutor.first_name}  #{@tutor.last_name}"
        else
            @display_text = "Your time availabilities do not match with any tutor. Please revise your preferences & try again."
        end
    end
    
    private
    
    def tutee_params
        params.require(:tutee).permit(:first_name, :last_name, :sid, :grade, :email, :phone_number,
        :semesters_at_cal, :major, :requested_class, :in_dsp)
    end
end
