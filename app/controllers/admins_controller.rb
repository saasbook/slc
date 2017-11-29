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
    
    def delete_tutor
        tutor_delete = Tutor.find(params[:id])
        tutor_delete.destroy
        redirect_to :back
    end

    def delete_tutee
        tutee_delete = Tutee.find(params[:id])
        tutee_delete.destroy
        redirect_to :back
    end
    
    def destroy_tutees
        Tutee.destroy_all
        redirect_to :back
    end
    
    def destroy_tutors
        Tutor.destroy_all
        redirect_to :back
    end
    
    def export_tutors
        @tutees = Tutee.order('created_at DESC')
        @tutors = Tutor.order('created_at DESC')
        respond_to do |format|
            format.html
            format.xlsx {
                response.headers['Content-Disposition'] = 'attachment; filename="Tutor/Tutee Database.xlsx"'
            }
        end
    end
    
    def tutee_sid
    end
    
    def tutee_sid_submit
        Tuteesid.create(params.require(:new_sid).permit(:SID))
        redirect_to :back
    end

    def tutor_sid
    end
    
    def tutor_sid_submit
        Tutorsid.create(params.require(:new_sid).permit(:SID))
        redirect_to :back
    end
end

