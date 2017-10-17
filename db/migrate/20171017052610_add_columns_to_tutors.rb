class AddColumnsToTutors < ActiveRecord::Migration
  def change
    add_column :tutors, :name, :string
    add_column :tutors, :year, :string
    add_column :tutors, :phone_number, :string
    add_column :tutors, :major, :string
    add_column :tutors, :bio, :text
    add_column :tutors, :sid, :integer
    add_column :tutors, :tutor_cohort, :string
  end
end
