class CreateTuteeSid < ActiveRecord::Migration
  def change
    create_table :tuteesid do |t|
      t.integer :SID
    end
  end
end
