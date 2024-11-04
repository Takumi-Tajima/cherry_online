class CreateBooks < ActiveRecord::Migration[7.2]
  def change
    create_table :books do |t|
      t.string :title, null: false, default: ''
      t.integer :price, null: false, default: 0
      t.date :released_on

      t.timestamps
    end
  end
end
