# frozen_string_literal: true

class Products::NameComponent < ApplicationComponent
  erb_template <<-ERB
    <p class="font-medium">
      <%= @name %>
    </p>
  ERB

  def initialize(product:)
    @name = product.name
  end
end
