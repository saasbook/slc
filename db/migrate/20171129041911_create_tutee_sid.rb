class CreateTuteeSid < ActiveRecord::Migration
  def change
    create_table :tuteesids do |t|
      t.string :SID
    end
  end
end
