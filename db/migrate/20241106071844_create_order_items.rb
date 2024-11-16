class CreateOrderItems < ActiveRecord::Migration[7.2]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true, index: false
      t.references :book, null: false, foreign_key: true
      t.integer :price

      t.timestamps
    end
    add_index :order_items, %i[order_id book_id], unique: true
  end
end
