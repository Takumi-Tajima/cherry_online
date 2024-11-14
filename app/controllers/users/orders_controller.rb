class Users::OrdersController < Users::ApplicationController
  def index
    @orders = current_user.orders.default_order
  end

  def show
    order = current_user.orders.find(params[:id])
    @order_items = order.order_items.default_order
  end

  def create
    current_cart.order!
    redirect_to books_path
  end
end
