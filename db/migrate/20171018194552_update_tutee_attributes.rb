class UpdateTuteeAttributes < ActiveRecord::Migration
  def change

    #Adding column attributes I need
    add_column :tutees, :last_name, :string
    add_column :tutees, :semesters_at_cal, :integer
    add_column :tutees, :first_name, :string
    add_column :tutees, :grade, :string
  end
end
