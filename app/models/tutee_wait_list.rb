class TuteeWaitList < ActiveRecord::Base
    @list = {}
    @total_tutees = 0
    @@instance = TuteeWaitList.new
    
    def add(key, value)
        self.total_tutees += 1
        self.list[key] = value
    end
    
    def list
        self.list
    end
    
    def get_position(tutee)
        self.list[tutee]
    end
    
    def total_tutees
        self.total_tutees
    end
    
    def self.instance
        @@instance
    end
end
