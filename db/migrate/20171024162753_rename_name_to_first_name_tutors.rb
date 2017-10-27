class RenameNameToFirstNameTutors < ActiveRecord::Migration
  def change
    rename_column :tutors, :name, :first_name
  end
end
