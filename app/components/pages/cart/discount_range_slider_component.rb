# frozen_string_literal: true

class Pages::Cart::DiscountRangeSliderComponent < ApplicationComponent
  def initialize(cart:)
    @cart = cart
    @total_price = cart.total_price
    @max_discount = [ cart.discount&.price_limit || 0, cart.total_price ].min
  end
end
