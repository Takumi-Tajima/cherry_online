class Book < ApplicationRecord
  validates :title, presence: true
  validates :price, numericality: { only_integer: true }
  validates :released_on, comparison: { greater_than: Time.current }

  scope :default_order, -> { order(created_at: :desc, id: :desc) }
end
