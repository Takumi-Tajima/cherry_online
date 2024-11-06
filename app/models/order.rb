class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

  def order_items_create_from_cart(current_cart)
    transaction do
      current_cart.cart_items.each do |cart_item|
        order_items.build(book: cart_item.book, price: cart_item.book.price)
      end
      save!
      current_cart.destroy!
    end
  end
end
