class OrdersController < ApplicationController
  def create
    order = current_user.orders.create!(purchased_at: Time.current)
    order.order_items_create_from_cart(current_cart)
    redirect_to books_path
  end
end
