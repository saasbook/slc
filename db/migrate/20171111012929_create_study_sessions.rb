class CreateStudySessions < ActiveRecord::Migration
  def change
    create_table :study_sessions do |t|
      t.integer :tutor_id
      t.integer :tutee_id
      t.integer :time_availability_id
    end
  end
end
