class CreateTimeAvailabilitiesTutees < ActiveRecord::Migration
  def change
    create_table :time_availabilities_tutees, id: false do |t|
      t.belongs_to :time_availability
      t.belongs_to :tutee
    end
  end
end
