class CreateDiscounts < ActiveRecord::Migration[8.0]
  def change
    create_table :discounts do |t|
      t.decimal :price_limit
      t.references :discountable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
