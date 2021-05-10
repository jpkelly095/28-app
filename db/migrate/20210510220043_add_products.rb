class AddProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.belongs_to :category
      t.string :name
      t.string :identifier, unique: true
      t.integer :quantity
      t.integer :price
      t.text :instructions

      t.timestamps
    end
  end
end
