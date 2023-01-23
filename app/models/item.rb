class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_state
  belongs_to :delivery_charge_burden
  belongs_to :address_prefecture
  belongs_to :days_up_to_delivery


  belongs_to :user
  has_one :purchase_record
  has_one_attached :image

  validates :item_name, presence: true, length: {maximum: 40}
  validates :product_description, presence: true, length: {maximum: 1000}
  validates :item_price, presence: true
  validates :item_price, numericality:{ only_integer: true, message: "は半角数字のみを使用してください" }
  validates :item_price, numericality:{ greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "は、¥300から¥9999999の範囲内で設定してください" }
  validates :image, presence: true
  validates :item_category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :item_state_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge_burden_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :address_prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :days_up_to_delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
end
