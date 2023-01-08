class AddItemPriceToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :item_price, :integer
  end
end
