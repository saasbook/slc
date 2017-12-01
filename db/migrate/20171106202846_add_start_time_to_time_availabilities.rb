class AddStartTimeToTimeAvailabilities < ActiveRecord::Migration
  def change
  	add_column :time_availabilities, :start_time, :integer
  end
end
