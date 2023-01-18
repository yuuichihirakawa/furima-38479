FactoryBot.define do
  factory :item do
    item_name {Faker::name}
    product_description {"説明"}
    item_category_id {2}
    item_state_id {2}
    delivery_charge_burden_id {2}
    address_prefecture_id {2}
    days_up_to_delivery_id {2}
    item_price {2000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
