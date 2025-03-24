# frozen_string_literal: true

class Pages::Cart::CardComponent < ApplicationComponent
  renders_one :name, Products::NameComponent
  renders_one :image, Products::ImageComponent
  renders_one :price, Products::PriceComponent
  renders_one :remove, Shared::Buttons::RemoveComponent
  renders_one :update_quantity, Shared::Buttons::UpdateQuantityComponent
end
