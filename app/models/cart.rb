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

  def merge_guest_cart(session_cart_id)
    return unless session_cart_id

    guest_cart = Cart.find(session_cart_id)

    mergable_books = []

    # ゲストカートの中身を配列として持たせる
    guest_cart.cart_items.each do |cart_item|
      Rails.logger.info '=' * 20
      Rails.logger.info 'cart_itemsの中身'
      Rails.logger.info cart_item
      Rails.logger.info '=' * 20

      mergable_books << cart_item

      Rails.logger.info '=' * 20
      Rails.logger.info 'mergable_bookの中身'
      Rails.logger.info mergable_books
      Rails.logger.info '=' * 20
    end

    cart_items << mergable_books
    # cart_items.save!

    Rails.logger.info '=' * 20
    Rails.logger.info 'cart_itmesの中身'
    Rails.logger.info cart_items
    Rails.logger.info '=' * 20

    # debugger

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
