class ChangeColumnTypeTimeAvailabilityTable < ActiveRecord::Migration
  def change
    change_column :time_availabilities, :start_time, 'integer USING CAST(start_time AS integer)'
    remove_column :time_availabilities, :end_time
  end
end
