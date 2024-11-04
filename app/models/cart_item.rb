class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :book

  validates :book_id, uniqueness: { scope: :cart_id }

  scope :default_order, -> { order(created_at: :desc, id: :desc) }
end
