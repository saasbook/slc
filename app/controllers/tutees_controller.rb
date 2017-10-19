class TuteesController < ApplicationController
    
   # before_action :authenticate_user! #needed?
    #  attr_accessor :first_name, :last_name, :sid, :grade, :email, :phone_number, :semesters_at_cal, :major, :course_name, :dsp, :date, :time
    
    def tutee_params
        params.require(:tutee).permit(:first_name, :last_name, :sid, :grade, :email, :phone_number,:semesters_at_cal,
        :major, :requested_course, :if_dsp, :times_available, :days_available)
    end

    def show
        id = params[:id]
        @tutee = Tutee.find(id)
    end
    
    def index
        #Should there be anything here?
    end

    def create
        #Receives form info
        #debugger
        @tutee = Tutee.create!(params[:tutee])
        flash[:notice] = "Form for #{@tutee.first_name + ' ' + @tutee.last_name} was succesfully created"
        
        #What do we want to render? Redirect to the home page
        #If succesful, home page, if not succesful new
        #redirect_to tutees_path
    end
    
    def new
       #Empty - something here?
    end
    
    def edit
    end

    
    def update
    end
    
    def destroy
    end
    
    
end
