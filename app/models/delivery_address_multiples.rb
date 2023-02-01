class DeliveryAddressMultiples
  include ActiveModel::Model
  attr_accessor :item_price, :user_id, :postal_code, :address_prefecture_id, :address_municipality, :address_block, :address_building, :telephone_number, :purchase_record

  with_options presence: true do
    validates :item_price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is invalid'}
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :address_municipality
    validates :address_block
    validates :telephone_number, numericality:{ only_integer: true, message: "は半角数字のみを使用してください" }
    validates :purchase_record
  end
  validates :address_prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 

  def save
    purchase_record = PurchaseRecord.create(item: item, user_id: user_id)
    delivery_addresses =DeliveryAddress.create(postal_code: postal_code, address_prefecture_id: address_prefecture.id, address_municipality: address_municipality, address_block: address_block, address_building: address_building, telephone_number: telephone_number, purchase_record: purchase_record)
  end
end