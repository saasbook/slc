class CreateTuteeSid < ActiveRecord::Migration
  def change
    create_table :tuteesid do |t|
      t.string :SID
    end
  end
end
