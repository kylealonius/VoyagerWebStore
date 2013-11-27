class ChangeDataTypeForCategory < ActiveRecord::Migration
  def up
    change_table :products do |t|
      change_column :products, :category, :integer
    end
  end
 
  def down
    change_column :products, :category, :string
  end
end

