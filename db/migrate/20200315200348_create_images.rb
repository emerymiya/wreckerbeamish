class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.text :message
      t.integer :user_id
      t.integer :product_id
      t.timestamps
    end
    add_index :images, [:user_id, :product_id]
    add_index :images, :product_id
  end
end
