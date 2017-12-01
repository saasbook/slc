class CreateTimeAvailabilitiesTutors < ActiveRecord::Migration
  def change
    create_table :time_availabilities_tutors, id: false do |t|
      t.belongs_to :time_availability
      t.belongs_to :tutor
    end
  end
end
