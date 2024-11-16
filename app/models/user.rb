class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :order_items, through: :orders

  def has_book?(book)
    order_items.exists?(book_id: book.id)
  end
end
