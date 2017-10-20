class TutorsController < ApplicationController
    
    def after_sign_in_path_for(tutor)
        stored_location_for(tutor) || root
    end
    
    def index
    end

    def create
    end
    
    def new
    end
    
    def edit
    end
    
    def show
    end
    
    def update
    end
    
    def destroy
    end
    
end
