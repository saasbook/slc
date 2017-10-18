class TuteeController < ApplicationController
    
    attr_accessor :first_name, :last_name, :sid, :class, :email, :phone_number, :semesters_at_cal, :grade, :course_name, :dsp
    
    def tutee_params
        params.require(:tutee).permit(:first_name, :last_name, :sid, :class, :email, :phone_number,:semesters_at_cal, :course_name, :dsp)
    end

    def show
        @tutee = Tutee.find(params[:id])
    end
    
    def index
    end

    def create
    end
    
    def new
        @tutee = Tutee.new    
    end
    
    def edit
    end

    
    def update
    end
    
    def destroy
    end
    
    
end
