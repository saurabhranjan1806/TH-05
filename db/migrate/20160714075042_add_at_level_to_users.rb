class AddAtLevelToUsers < ActiveRecord::Migration
  def change
    add_column :users, :at_level, :integer
  end
end
