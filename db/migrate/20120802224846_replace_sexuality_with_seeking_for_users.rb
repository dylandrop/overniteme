class ReplaceSexualityWithSeekingForUsers < ActiveRecord::Migration
  def up
    add_column :users, :seeking, :string
    remove_column :users, :sexuality
  end

  def down
    add_column :users, :sexuality, :string
    remove_column :users, :seeking
  end
end
