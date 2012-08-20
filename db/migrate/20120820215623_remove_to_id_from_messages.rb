class RemoveToIdFromMessages < ActiveRecord::Migration
  def up
    remove_column :messages, :to_id, :integer
  end

  def down
    add_column :messages, :to_id, :integer
  end
end
