# frozen_string_literal: true

class Pages::Cart::CardComponent < ApplicationComponent
  renders_one :name, Products::NameComponent
  renders_one :image, Products::ImageComponent
  renders_one :price, Products::PriceComponent
  renders_one :remove, Reusable::Buttons::RemoveComponent
  renders_one :update_quantity, Reusable::Buttons::UpdateQuantityComponent
end
