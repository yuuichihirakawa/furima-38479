# frozen_string_literal: true

class DeviseCreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      # t.string :item_name           null: false
      # t.text :product_description   null: false
      # t.integer :item_category_id   null: false
      # t.integer :item_state_id      null: false
      # t.integer :item_price         null: false
      # t.integer :delivery_charge_burden_id  null: false
      # t.integer :days_up_to_delivery_id     null: false
      # t.integer :address_prefecture_id      null: false
      # t.references :user                    null: false

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :items, :email,                unique: true
    add_index :items, :reset_password_token, unique: true
    # add_index :items, :confirmation_token,   unique: true
    # add_index :items, :unlock_token,         unique: true
  end
end
