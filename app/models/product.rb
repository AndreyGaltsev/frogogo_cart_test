class Product < ApplicationRecord
  has_many :picked_products, dependent: :destroy
  has_many :stocks, dependent: :destroy
  has_many_attached :images

  def price
    stocks.first&.price&.to_i
  end
end
