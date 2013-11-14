class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :image
      t.decimal :price
      t.integer :stock_quantity
      t.boolean :sale

      t.timestamps
    end
  end
end
