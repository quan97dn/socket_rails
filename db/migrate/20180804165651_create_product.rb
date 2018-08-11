class CreateProduct < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.integer :quantity
      t.integer :status, default: 1
      t.string :description
      t.string :images, array: true
      t.timestamps
    end
  end
end
