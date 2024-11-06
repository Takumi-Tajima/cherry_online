class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :book

  validates :order_id, uniqueness: { scope: :book_id }
end
