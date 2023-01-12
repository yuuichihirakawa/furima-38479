class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category_id
  belongs_to :item_state_id
  belongs_to :delivery_charge_burden_id
  belongs_to :address_prefecture_id
  belongs_to :days_up_to_delivery_id


  belongs_to :user
  has_one :purchase_record
  has_one_attached :image

  validates :item_name, presence: true, length: {maximum: 40}
  validates :product_description, presence: true, length: {maximum: 1000}
  validates :item_price, presence: true, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  validates :image, presence: true
  validates :item_category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :item_state_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge_burden_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :address_prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :days_up_to_delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
end
