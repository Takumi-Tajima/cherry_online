class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

  scope :default_order, -> { order(created_at: :desc) }

  def total_price
    total_price = 0
    order_items.each do |order_item|
      total_price += order_item.price
    end
    total_price
  end
end
