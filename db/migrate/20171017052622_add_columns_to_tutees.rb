class AddColumnsToTutees < ActiveRecord::Migration
  def change
    add_column :tutees, :name, :string
    add_column :tutees, :year, :string
    add_column :tutees, :phone_number, :string
    add_column :tutees, :major, :string
    add_column :tutees, :requested_class, :string
    add_column :tutees, :sid, :integer
    add_column :tutees, :in_dsp, :boolean
    add_column :tutees, :tutor_id, :integer
  end
end
