class PickedProduct < ApplicationRecord
  belongs_to :product
  belongs_to :cart, optional: true, touch: true

  def total_price
    price = product.price
    (price * self.quantity).to_i
  end
end
