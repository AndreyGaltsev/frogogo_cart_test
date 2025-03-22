# frozen_string_literal: true

class Pages::Cart::ProductComponent < ApplicationComponent
  with_collection_parameter :picked_product

  def initialize(picked_product:)
    @product = picked_product.product
    @product_id = @product.id
    @picked_product = picked_product
    @picked_product_id = picked_product.id
    @picked_product_quantity = picked_product.quantity
    @turbo_frame = "cart-card-#{@product_id}"
  end
end
