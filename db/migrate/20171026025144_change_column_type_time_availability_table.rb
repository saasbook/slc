class ChangeColumnTypeTimeAvailabilityTable < ActiveRecord::Migration
  def change
    change_column :time_availabilities, :start_time, :integer
    remove_column :time_availabilities, :end_time
  end
end
