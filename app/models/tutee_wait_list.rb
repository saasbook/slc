class TuteeWaitList < ActiveRecord::Base
    has_many :tutees
    
    def add_tutee(tutee)
        if !self.tutees.include?(tutee)
            tutee.waitlist_added_time = DateTime.now
            tutee.save!
            self.tutees << tutee
            self.total_tutees += 1
            self.save!
        end
    end
    
    def remove_tutee(tutee)
        if self.tutees.include?(tutee)
            self.tutees.delete(tutee)
            self.total_tutees -= 1
            self.save!
        end
    end
    
    def waitlist_position(tutee)
        sorted = self.tutees.sort_by(&:waitlist_added_time)
        position = sorted.find_index(tutee) + 1
        position
    end
end
