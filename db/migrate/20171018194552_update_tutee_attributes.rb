class UpdateTuteeAttributes < ActiveRecord::Migration
  def change

    #Adding column attributes I need
    add_column :tutees, :last_name, :string
    add_column :tutees, :semesters_at_cal, :integer
    add_column :tutees, :days_available, :hash
    add_column :tutees, :times_available, :hash
    add_column :tutees, :first_name, :string
    add_column :tutees, :grade, :string
    
    # remove_column :tutees, :name, :string
    # remove_column :tutees, :year, :string
    

    #rake db:migrate 
    #rake db:test:prepare
  end
end
