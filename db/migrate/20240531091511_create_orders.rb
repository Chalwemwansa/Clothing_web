class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :number
      t.string :email
      t.string :size
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
