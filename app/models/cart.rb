class Cart < ApplicationRecord
  has_many :picked_products, dependent: :destroy
  has_many :products, through: :picked_products
  has_one :discount, as: :discountable, dependent: :destroy

  def cleanable?
    picked_products.present?
  end

  def total_price
    picked_products.to_a.sum(&:total_price)
  end
end
