class RenameTimeAvailabitlitiesTable < ActiveRecord::Migration
  def change
    rename_table :time_availabilitys, :time_availabilities
  end
end
