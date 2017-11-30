class AddWaitListColumnsTutee < ActiveRecord::Migration
  def change
    add_column :tutees, :tutee_wait_list_id, :integer
    add_column :tutees, :waitlist_added_time, :datetime
    add_column :tutee_wait_lists, :tutee_id, :integer
  end
end
