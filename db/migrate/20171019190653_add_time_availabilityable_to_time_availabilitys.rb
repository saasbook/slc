class AddTimeAvailabilityableToTimeAvailabilitys < ActiveRecord::Migration
  def up
    change_table :time_availabilitys do |t|
      t.references :time_availabilityable, polymorphic: true
    end
  end

  def down
    change_table :time_availabilitys do |t|
      t.remove_references :time_availabilityable, polymorphic: true
    end
  end
end
