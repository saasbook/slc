class RemoveStartTimeFromTimeAvailabilities < ActiveRecord::Migration
  def change
  	remove_column :time_availabilities, :start_time
  end
end
