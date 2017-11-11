class AddColumnToTuteesAndTutors < ActiveRecord::Migration
  def change
    add_column :tutees, :study_session_id, :integer
    add_column :tutors, :study_session_id, :integer
    add_column :time_availabilities, :study_session_id, :integer
  end
end
