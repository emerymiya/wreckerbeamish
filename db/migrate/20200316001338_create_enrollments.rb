class CreateEnrollments < ActiveRecord::Migration[5.2]
  def change
    create_table :enrollments do |t|
      t.integer :user_id
      t.integer :product_id
      t.timestamps
    end
    add_index :enrollments, [:user_id, :product_id]
    add_index :enrollments, :product_id
  end
end
