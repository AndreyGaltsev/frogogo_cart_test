class CartsController < ApplicationController
  before_action :set_current_cart
  def show
  end

  def clear
  end

  private
  def set_current_cart
    @current_cart ||= Cart.first
  end
end
