class CartsController < ApplicationController
  before_action :set_current_cart, :set_picked_products

  def show
  end

  def clear
    @current_cart.clear_cart
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("cart",
                                                  template: "carts/show",
                                                  locals: { cart: @current_cart })
      end
    end
  end

  def update_quantity
    picked_product = @picked_products.find_by(product_id: cart_params[:id])
    picked_product.update(quantity: cart_params[:quantity])
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update("cart_offer", Pages::Cart::OfferComponent.new(cart: @current_cart).render_in(view_context))
      end
    end
  end

  def remove_product
    picked_product = @current_cart.picked_products.find_by(id: cart_params[:id])
    turbo_frame_id = "cart-card-#{picked_product.product_id}"
    picked_product.destroy
    respond_to do |format|
      format.turbo_stream do
        if @picked_products.reload.any?
          render turbo_stream: [
            turbo_stream.remove(turbo_frame_id),
            turbo_stream.update("cart_offer", Pages::Cart::OfferComponent.new(cart: @current_cart).render_in(view_context))
          ]
        else
          render turbo_stream: turbo_stream.replace("cart",
                                                    template: "carts/show",
                                                    locals: { cart: @current_cart })
        end
      end
    end
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
