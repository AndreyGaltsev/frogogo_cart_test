# frozen_string_literal: true

class Base::Buttons::UpdateQuantityComponent < ApplicationComponent
  def initialize(path:, product_id:, picked_product_quantity:)
    @path = path
    @product_id = product_id
    @picked_product_quantity = picked_product_quantity
  end
end
