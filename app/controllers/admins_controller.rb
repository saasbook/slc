class AdminsController < ApplicationController

    def show
        @tutors = Tutor.all
        @tutees = Tutee.all
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
        #Nothing necessary
    end

    #Update all of the attributes gathered from edit form
    def update
        #Nothing necessary
    end
    
    def destroy
        
    end
    
    def edit_match
        @tutee = Tutee.find(params[:id])
        @avail_tutors = @tutee.find_available_tutors
    end
    
    def assign
        puts params
        #@admin = Admin.find(params[:id])
        @tutee = Tutee.find(params[:tutee])
        tutor = Tutor.find(params[:tutor])
        @tutee.tutor = tutor
        @tutee.save!
        redirect_to admin_path(1)
    end
    
end

