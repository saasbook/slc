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
        @time_slots = ["8:00 - 9:00", "9:00 - 10:00", "10:00 - 11:00", "11:00 - 12:00", "12:00 - 1:00", "1:00 - 2:00", "2:00 - 3:00", "3:00 - 4:00", "4:00 - 5:00", "5:00 - 6:00"]
        @days = ["Mon.", "Tues.", "Wed.", "Thurs.", "Fri.", "Sat.", "Sun."]
    end

    #Update all of the attributes gathered from edit form
    def update
        @tutee = Tutee.find(params[:id])
        @tutee.update_attributes(tutee_params)
        time_slot_ids = params[:tutee][:time_availabilitys_ids]
        @tutee.update_time_availabilitys(time_slot_ids)
        check = Tuteesid.where(SID: params[:tutee][:sid])
        if check.empty?
            flash[:error] = "Your SID was not found. Make sure you go to an orientation before filling out this form."
            redirect_to edit_tutee_path
        elsif at_least_one_time_availability? && @tutee.save
            flash[:notice] = "Form for #{@tutee.first_name + ' ' + @tutee.last_name} was succesfully created"
            redirect_to tutor_match_path(@tutee)
        elsif at_least_one_time_availability?
            flash[:error] = @tutee.errors.full_messages.first
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
            tutor_match_helper(@tutee)
        end
    end

    def tutor_match_helper(tut)
        @tutee = tut
        @new_timings = Set.new []
        Tutor.all.each do |tutor|
            if !tutor.time_availabilitys.empty? #tutor is available
                @new_timings = @new_timings | tutor.time_availabilitys # Union
            end
        end
            
        # #if none of the tutors are available, add to waitlist
        if @new_timings.empty?
          @waitlist = TuteeWaitList.find_by_id(1)
          @waitlist.add_tutee(@tutee)
          @display_text = "We do not have any open tutoring slots. Your waitlist position is ##{@waitlist.waitlist_position(@tutee)}"
        else #if some tutor is available, show correct error message
          @display_text = "Your time availabilities do not match with any tutor. Please revise your preferences & try again. Open tutoring slot(s):"
          @new_timings.each do |time|
              @display_text += " #{time.day} at #{time.start_time}," 
          end
          @display_text = @display_text.chop
          @display_text += "."
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

