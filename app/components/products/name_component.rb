# frozen_string_literal: true

class Products::NameComponent < ApplicationComponent
  erb_template <<-ERB
    <h3 class="font-medium">
      <%= @name %>
    </h3>
  ERB

  def initialize(product:)
    @name = product.name
  end
end
