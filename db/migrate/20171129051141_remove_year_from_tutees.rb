class RemoveYearFromTutees < ActiveRecord::Migration
  def change
    remove_column :tutees, :year
  end
end
