class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :gender, :string
    add_column :users, :group, :boolean
    add_column :users, :sexuality, :string
    add_column :users, :description, :text
  end
end
