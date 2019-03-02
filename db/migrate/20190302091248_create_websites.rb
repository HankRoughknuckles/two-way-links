class CreateWebsites < ActiveRecord::Migration[5.2]
  def change
    create_table :websites do |t|
      t.string :domain_and_suffix
      t.timestamps
    end
    add_index :websites, :domain_and_suffix
  end
end
