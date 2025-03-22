class CartsController < ApplicationController
  before_action :set_current_cart, :set_picked_products

  def show
  end

  def clear
    @current_cart.clear_cart
    redirect_to cart_path
  end

  def update_quantity

  end

  def remove_product

  end

  private
  def set_current_cart
    @current_cart ||= Cart.first
  end

  def set_picked_products
    @picked_products = @current_cart.picked_products
  end

  def cart_params
    params.permit(:id, :quantity, :authenticity_token)
  end
end
