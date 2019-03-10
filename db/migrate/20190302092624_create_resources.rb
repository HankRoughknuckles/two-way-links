class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.references :website
      t.string :url

      t.timestamps
    end
    add_index :resources, :url, unique: true
  end
end
