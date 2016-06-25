class AddLastCompletedToUsers < ActiveRecord::Migration
#to store the time of completion of the last level 
  def up
  	add_column :users, :last_completed, :timestamp
  end

  def down
  	remove_column :users, :last_completed, :timestamp
  end
end
