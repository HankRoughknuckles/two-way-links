class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.integer :subscriber_id
      t.integer :target_id

      t.timestamps
    end
    add_index :links, :subscriber_id
    add_index :links, :target_id
  end
end
