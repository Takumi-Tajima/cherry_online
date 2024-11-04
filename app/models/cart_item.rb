class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :book

  scope :default_order, -> { order(created_at: :desc, id: :desc) }
end
