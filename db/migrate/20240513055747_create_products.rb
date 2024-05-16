class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.text :description
      t.text :details
      t.text :shipping_details
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
