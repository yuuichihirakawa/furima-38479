class AddDeliveryChargeBurdenIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :delivery_charge_burden_id, :integer
  end
end
