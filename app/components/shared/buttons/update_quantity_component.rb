# frozen_string_literal: true

class Shared::Buttons::UpdateQuantityComponent < ApplicationComponent
  def initialize(path:, product_id:, picked_product_quantity:, stimulus_controller: "update-quantity", stimulus_actions: nil, stimulus_targets: nil)
    @path = path
    @product_id = product_id
    @picked_product_quantity = picked_product_quantity
    @stimulus_controller = stimulus_controller
    @stimulus_actions = stimulus_actions || {
      input: "input->#{@stimulus_controller}#submit",
      decrement: "click->#{@stimulus_controller}#decrement",
      increment: "click->#{@stimulus_controller}#increment"
    }
    @stimulus_targets = stimulus_targets || { quantity: "quantity" }
  end
end
