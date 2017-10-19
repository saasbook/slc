class TuteesController < ApplicationController

    #before_action
    
    

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
    
    def edit
        @tutee = Tutee.find(params[:id])
    end

    
    def update
        @tutee = Tutee.find(params[:id])
        @tutee.update_attributes!(tutee_params)
        flash[:notice] = "Form for #{tutee.first_name + ' ' + tutee.last_name} was succesfully created"
        
        #What do we want to render? Redirect to the home page
        #If succesful, home page, if not succesful new
        redirect_to 'filler'
        #Why isn't this rendering?  
    
    end
    
    def destroy
    end
    
    private
    
    def tutee_params
        params.require(:tutee).permit(:first_name, :last_name, :sid, :grade, :email, :phone_number,
        :semesters_at_cal, :major, :requested_course, :if_dsp, :times_available, :days_available)
    end
end
