# frozen_string_literal: true

class Products::ImageComponent < ApplicationComponent
  erb_template <<-ERB
    <%= image_tag @image, loading: "lazy", **@image_options %>
  ERB

  def initialize(product:, image_options:)
    @image = product.images.first
    @image_options = image_options
  end
end
