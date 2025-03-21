class CreatePickedProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :picked_products do |t|
      t.integer :quantity
      t.references :product, null: false, foreign_key: true
      t.references :cart, foreign_key: true

      t.timestamps
    end
  end
end
