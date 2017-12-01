class CreateStudySessionsTimeAvailabilities < ActiveRecord::Migration
  def change
    create_table :study_sessions_time_availabilities do |t|
      t.belongs_to :time_availability
      t.belongs_to :study_session
    end
  end
end