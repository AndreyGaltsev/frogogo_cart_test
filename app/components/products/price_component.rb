# frozen_string_literal: true

class Products::PriceComponent < ApplicationComponent
  erb_template <<-ERB
    <p class="text-xl font-medium">
      <%= format_price(@price) %> <span class="currency">₽</span>
    </p>
  ERB

  def initialize(product:)
    @price = product.price
  end
end
