class OrdersController < ApplicationController
  def create
    current_cart.order!
    redirect_to books_path
  end
end
