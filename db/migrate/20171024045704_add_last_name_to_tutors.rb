class AddLastNameToTutors < ActiveRecord::Migration
  def change
    add_column :tutors, :last_name, :string
  end
end
