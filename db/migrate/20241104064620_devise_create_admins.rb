# frozen_string_literal: true

class DeviseCreateAdmins < ActiveRecord::Migration[7.2]
  def change
    create_table :admins do |t|
      t.string :name, null: false, default: ''
      t.string :email,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''

      t.timestamps null: false
    end

    add_index :admins, :email, unique: true
  end
end
