class RenameTimeAvailabilities < ActiveRecord::Migration
  def self.up
    rename_table :time_availabilities, :time_availabilitys
  end

  def self.down
    rename_table :time_availabilitys, :time_availabilities
  end
end
