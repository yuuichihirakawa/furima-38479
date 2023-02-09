FactoryBot.define do
  factory :delivery_address_multiples do
    postal_code {"123-4567"}
    address_prefecture_id {2}
    address_municipality {"市町村区"}
    address_block {0}
    address_building {"建物名"}
    telephone_number {"09012345678"}
    token {"tok_abcdefghijk00000000000000000"}
    # association :user
    association :item
  end
end
