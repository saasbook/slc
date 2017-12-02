class CreateTuteeWaitLists < ActiveRecord::Migration
  def change
    create_table :tutee_wait_lists do |t|
      t.timestamps null: false
      t.integer :total_tutees
    end
  end
end
