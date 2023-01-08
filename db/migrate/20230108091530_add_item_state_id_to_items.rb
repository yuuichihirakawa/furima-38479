class AddItemStateIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :item_state_id, :integer
  end
end
