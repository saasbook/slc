class TutorsController < ApplicationController

    before_action :validate_params, only: [:update]

    
    def validate_params
        if params[:tutor][:first_name] == nil || params[:tutor][:first_name].length == 0
                throw ArgumentError
        elsif params[:tutor][:last_name] == nil || params[:tutor][:last_name].length == 0
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
        flash[:notice] = "Form for #{@tutor.first_name + ' ' + @tutor.last_name} was succesfully created"
        redirect_to tutor_path(@tutor)
    end
    
    def destroy
    end
    
    def tutor_params
        params.require(:tutor).permit(:first_name, :last_name, :sid, :year, :email, :phone_number, :major, :tutor_cohort, :bio)
    end
    
    def tutee_match
      @tutor = Tutor.find(params[:id])
      @tutees = @tutor.tutees
      if !@tutees.empty?
          @display_text = ""
          @tutees.each do |tutee|
              @display_text += "#{tutee.first_name}  #{tutee.last_name}\n"
          end
      else
          @display_text = "You have not been assigned any students yet."
      end
    end

end

