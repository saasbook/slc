class CreateTimeAvailabilities < ActiveRecord::Migration
  def change
    create_table :time_availabilities do |t|
      t.string :day
      t.time :start_time
      t.time :end_time

      t.timestamps null: false
    end
  end
end
