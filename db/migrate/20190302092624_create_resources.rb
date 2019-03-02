class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.references :website
      t.string :subdomain
      t.string :path
      t.string :url
      t.integer :reference_count, default: 0

      t.timestamps
    end
    add_index :resources, :url
  end
end
