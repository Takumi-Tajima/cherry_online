class Book < ApplicationRecord
  has_many :cart_items, dependent: :destroy

  validates :title, presence: true
  validates :price, numericality: { only_integer: true }
  validates :released_on, comparison: { greater_than: Time.current }

  scope :default_order, -> { order(created_at: :desc, id: :desc) }
end
