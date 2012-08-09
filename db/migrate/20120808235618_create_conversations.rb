class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :from_id
      t.integer :to_id

      t.timestamps
    end
  end
end
