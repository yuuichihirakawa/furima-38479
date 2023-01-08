class AddDaysUpToDeliveryIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :days_up_to_delivery_id, :integer
  end
end
