class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :cart_items, dependent: :destroy
  has_many :books, through: :cart_items

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
    transaction do
      mergeable_books = guest_cart.cart_items.select { |item| addable?(item) }
      books << mergeable_books
    end
    guest_cart.destroy!
  end

  def addable?(cart_item)
    !added_book?(cart_item.book) && !user.has_book?(cart_item.book)
  end

  def added_book?(book)
    cart_items.exists?(book_id: book.id)
  end
end
