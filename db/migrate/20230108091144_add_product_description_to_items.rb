class AddProductDescriptionToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :product_description, :text
  end
end
