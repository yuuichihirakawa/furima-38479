FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              {Faker::Name}
    email                 {Faker::Internet.email}
    password { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation {password}
    first_name            { person.first.kanji }
    last_name             { person.last.kanji }
    first_name_kana       { person.first.katakana }
    last_name_kana        { person.last.katakana }
    birth_date            {Faker::Date.backward}
    # association :delivery_address
  end
end