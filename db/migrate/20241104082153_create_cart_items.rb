class CreateCartItems < ActiveRecord::Migration[7.2]
  def change
    create_table :cart_items do |t|
      t.references :cart, null: false, foreign_key: true, index: false
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
    add_index :cart_items, %i[cart_id book_id], unique: true
  end
end
