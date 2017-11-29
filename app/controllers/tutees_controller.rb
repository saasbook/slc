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
    end

    #Update all of the attributes gathered from edit form
    def update
        begin
            @time_availabilitys_ids = params[:tutee][:time_availabilitys_ids]
            @tutee = Tutee.find(params[:id])
            @tutee.update_attributes!(tutee_params)
            @tutee.time_availabilitys.destroy_all
            if @time_availabilitys_ids != nil
                @time_availabilitys_ids.each do |id|
                    time = TimeAvailability.find(id)
                    @tutee.time_availabilitys << time
                end
            end
            flash[:notice] = "Form for #{@tutee.first_name + ' ' + @tutee.last_name} was succesfully created"
            redirect_to tutor_match_path(@tutee)
        rescue ActiveRecord::RecordInvalid => invalid   
            flash[:error] = invalid.record.errors
            redirect_to edit_tutee_path(@tutee)
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
            
            # @new_timings = Set.new []
            # Tutor.all.each do |tutor|
            #     if !tutor.time_availabilitys.empty? #tutor is available
            #         @new_timings = @new_timings | tutor.time_availabilitys
            #     end
            # end
            
            # #if none of the tutors are available, add to waitlist
            # #if @new_timings.empty?
            #   @waitlist = TuteeWaitList.instance.list
            #   p "##############"
            #   p "##############"
            #   p "##############"
            #   p @waitlist
            #   p "##############"
            #   p "##############"
            #   p "##############"
            #   TuteeWaitList.instance.add(@tutee, TuteeWaitList.instance.total_tutees)
            #   @display_text = "We do not have any open tutoring slots. Your waitlist position is ##{TuteeWaitList.instance.get_position(@tutee)}"
            # else #if some tutor is available, show correct error message
            #   @display_text = "Your time availabilities do not match with any tutor. Please revise your preferences & try again. Open tutoring slot(s):"
            #   @new_timings.each do |time|
            #       @display_text += " #{time.day} at #{time.start_time}," 
            #   end
            #   @display_text = @display_text.chop
            #   @display_text += "."
            # end
        end
    end
    
    def update_times
        time_ids.each do |id|
            time = TimeAvailability.find(id)
            tutee.time_availabilitys << time
        end
    end
    
    private
    
    def tutee_params
        params.require(:tutee).permit(:first_name, :last_name, :sid, :grade, :email, :phone_number,
        :semesters_at_cal, :major, :requested_class, :DSP, :EOP, :SBC, :FPF, :TRSP, :UCIEP, :BISP)
    end
end

