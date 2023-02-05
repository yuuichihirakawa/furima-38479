class CreateDeliveryAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_addresses do |t|
      t.string        :postal_code,            null: false
      t.integer       :address_prefecture_id,  null: false
      t.string        :address_municipality,   null: false
      t.string        :address_block,          null: false
      t.string        :address_building
      t.string        :telephone_number,       null: false
      t.references    :purchase_record,        null: false, foreign_key: true
      t.timestamps
    end
  end
end