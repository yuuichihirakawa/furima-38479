class AddAddressPrefectureIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :address_prefecture_id, :integer
  end
end
