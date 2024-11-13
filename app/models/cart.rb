class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :cart_items, dependent: :destroy

  def order!
    transaction do
      user.orders.create!(purchased_at: Time.current) do |order|
        cart_items.each do |cart_item|
          order.order_items.build(book: cart_item.book, price: cart_item.book.price)
        end
      end
      destroy!
    end
  end

  def merge_guest_cart(cart_id)
    return unless cart_id

    guest_cart = Cart.find(cart_id)
    guest_cart.cart_items.each do |cart_item|
      cart_items << cart_item
    end
    guest_cart.destroy!
  end

  # def merge_guest_cart(guest_cart)
  #   transaction do
  #     guest_cart.cart_items.each do |cart_item|
  #       debugger
  #       cart_items.create!(book: cart_item.book_id)
  #     end
  #     guest_cart.destroy!
  #   end
  # end
end
