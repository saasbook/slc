class AddGroupsToTutees < ActiveRecord::Migration
  def change
  	add_column :tutees, :DSP, :boolean
  	add_column :tutees, :EOP, :boolean
  	add_column :tutees, :SBC, :boolean
  	add_column :tutees, :FPF, :boolean
  	add_column :tutees, :TRSP, :boolean
  	add_column :tutees, :UCIEP, :boolean
  	add_column :tutees, :BISP, :boolean	
  end
end
