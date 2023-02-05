class DeliveryAddressMultiples
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :address_prefecture_id, :address_municipality, :address_block, :address_building, :telephone_number, :purchase_record

  with_options presence: true do
    # validates :item_price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is invalid'}
    # validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :address_municipality
    validates :address_block
    validates :telephone_number, numericality:{ only_integer: true, message: "is invalid" }
    # validates :purchase_record
  end
  validates :address_prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :telephone_number, length: { maximum: 11, message: "is invalid"}
  validates :telephone_number, length: { minimum: 10, message: "is invalid"}

  def save
    purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)
    delivery_address = DeliveryAddress.create(postal_code: postal_code, address_prefecture_id: address_prefecture_id, address_municipality: address_municipality, address_block: address_block, address_building: address_building, telephone_number: telephone_number, purchase_record_id: purchase_record.id)
  end
end