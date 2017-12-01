class TuteesController < ApplicationController

    def show
    end
    
    def index
        #Should there be anything here?
    end

  
    def create
        #@tutee = Tutee.new(tutee_params)
    end
    
    def new
       #Empty - something here?
    end
    
    #Display form for tutee to enter in attributes
    def edit
        @tutee = Tutee.find(params[:id])
        @time_slots = ["8 - 9", "9 - 10", "10 - 11", "11 - 12", "12 - 1", "1 - 2", "2 - 3", "3 - 4", "4 - 5", "5 - 6"]
        @days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    end

    #Update all of the attributes gathered from edit form
    def update
        @tutee = Tutee.find(params[:id])
        @tutee.update_attributes(tutee_params)
        time_slot_ids = params[:tutee][:time_availabilitys_ids]
        @tutee.update_time_availabilitys(time_slot_ids)
        if at_least_one_time_availability? && @tutee.save
            flash[:notice] = "Form for #{@tutee.first_name + ' ' + @tutee.last_name} was succesfully created"
            redirect_to tutor_match_path(@tutee)
        elsif at_least_one_time_availability? 
            flash[:error] = @tutee.full_messages.first
            redirect_to edit_tutee_path(@tutee)
        else
            flash[:error] = "Must check at least one time availability"
            redirect_to edit_tutee_path
        end
    end
    
    def destroy
    end
    
    def tutor_match
        if (tutee_signed_in?)
            if (current_tutee.id.to_s != params[:id]) 
                params[:id] = current_tutee.id.to_s
                redirect_to tutor_match_path(current_tutee)
            end
        end
        @tutee = Tutee.find(params[:id])
        @tutee.assign_tutor_and_session
        @tutor = @tutee.tutor
        if !@tutor.nil?
            @study_session_time = @tutee.study_session.time_availabilitys[0]
            @display_text = "#{@tutor.first_name}  #{@tutor.last_name} - "
            @display_text += "#{@study_session_time.day} at #{@study_session_time.start_time}"
            TutorMailer.match_notification(@tutee, @tutor, @study_session_time).deliver
        else
            @display_text = "Your time availabilities do not match with any tutor. Please revise your preferences & try again."
        end
    end
    
    
    private
    
    def tutee_params
        params.require(:tutee).permit(:first_name, :last_name, :sid, :grade, :email, :phone_number,
        :semesters_at_cal, :major, :requested_class, :DSP, :EOP, :SBC, :FPF, :TRSP, :UCIEP, :BISP)
    end

    def at_least_one_time_availability?
        params[:tutee][:time_availabilitys_ids] != nil
    end
end

