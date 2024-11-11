class Cart::CartItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[create destroy]

  def create
    book = Book.find(params[:book_id])
    current_cart.cart_items.find_or_create_by!(book:)
    redirect_to books_path, notice: 'カートに追加しました'
  end

  def destroy
    current_cart.cart_items.find(params[:id]).destroy!
    redirect_to cart_path, notice: 'カートから削除しました'
  end
end
