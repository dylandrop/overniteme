class RemoveGroupFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :group
  end

  def down
    add_column :users, :group, :boolean
  end
end
