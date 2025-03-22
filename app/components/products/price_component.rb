# frozen_string_literal: true

class Products::PriceComponent < ApplicationComponent
  erb_template <<-ERB
    <div class="text-xl font-medium">
      <%= @price %> <span>&#8381;</span>
    </div>
  ERB

  def initialize(product:)
    @price = product.price
  end

end
