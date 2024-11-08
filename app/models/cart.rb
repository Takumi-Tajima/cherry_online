class Cart < ApplicationRecord
  belongs_to :user
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
end
