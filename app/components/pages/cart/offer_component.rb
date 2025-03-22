# frozen_string_literal: true

class Pages::Cart::OfferComponent < ApplicationComponent
  def initialize(cart:)
    @cart = cart
  end
end
