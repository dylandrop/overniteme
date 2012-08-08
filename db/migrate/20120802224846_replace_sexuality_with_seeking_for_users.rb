class ReplaceSexualityWithSeekingForUsers < ActiveRecord::Migration
  def up
    add_column :users, :seeking, :string
    remove_column :users, :sexuality, :string
  end

  def down
    add_column :users, :sexuality, :string
    add_column :users, :seeking, :string
  end
end
