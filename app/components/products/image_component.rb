# frozen_string_literal: true

class Products::ImageComponent < ApplicationComponent
  erb_template <<-ERB
    <% if @image.present? %>
      <%= image_tag @image, loading: "lazy", **@image_options %>
    <% else %>
      <%= image_tag "/fallback_image.jpeg", loading: "lazy", **@image_options %>
    <% end %>
  ERB

  def initialize(product:, image_options:)
    @image = product.images.attached? ? product.images.first : nil
    @image_options = image_options
  end
end
