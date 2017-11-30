class CreateTutorSid < ActiveRecord::Migration
  def change
    create_table :tutorsid do |t|
      t.string :SID
    end
  end
end
