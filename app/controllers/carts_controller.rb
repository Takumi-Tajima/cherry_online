class CartsController < ApplicationController
  before_action :set_cart_items, only: %i[show]

  def show
  end

  private

  def set_cart_items
    @cart_items = current_cart.cart_items.default_order
  end
end
