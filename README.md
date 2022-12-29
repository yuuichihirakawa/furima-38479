# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# テーブル設計

## users テーブル

| Column                       | Type   | Options                   |
| ---------------------------- | ------ | ------------------------- |  
| nickname                     | string | null: false, unique: true |
| email                        | string | null: false, unique: true |
| encrypted_password           | string | null: false               |
| first_name                   | string | null: false               |
| first_name_kana              | string | null: false               |
| last_name                    | string | null: false               |
| last_name_kana               | string | null: false               |
| birth_date                   | string | null: false               |
| current_postal_code          | string | null: false               |
| current_address_prefectures  | text   | null: false               |
| current_address_municipality | text   | null: false               |
| current_address_block        | string | null: false               |
| current_address_building     | text   | null: false               |
| current_telephone_number     | string | null: false               |

### Association
- has_many :items
- has_many :purchase_records

## itemsテーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| item_name                  | text       | null: false,                   |
| item_image                 | image      | null: false                    |
| product_description        | text       | null: false                    |
| item_category              | text       | null: false                    |
| item_state                 | text       | null: false                    |
| item_price                 | string     | null: false                    |
| sales_fee                  | string     | null: false                    |
| sales_profit               | string     | null: false                    |
| delivery_charge_burden     | string     | null: false                    |
| nickname                   | references | null: false, foreign_key: true |
| current_address_prefectures| references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :purchase_records
- has_many :delivery_address_multiples


## purchase_recordsテーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| nickname                   | references | null: false, foreign_key: true |
| item_name                  | references | null: false, foreign_key: true |
| item_image                 | references | null: false, foreign_key: true |
| product_description        | references | null: false, foreign_key: true |
| item_category              | references | null: false, foreign_key: true |
| item_state                 | references | null: false, foreign_key: true |
| item_price                 | references | null: false, foreign_key: true |
| sales_fee                  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :delivery_address_multiples


## delivery_address_multiplesテーブル
| Column                       | Type       | Options                        |
| ---------------------------- | ---------- | ------------------------------ |
| nickname                     | references | null: false, foreign_key: true |
| current_postal_code          | references | null: false, foreign_key: true |
| current_address_prefectures  | references | null: false, foreign_key: true |
| current_address_municipality | references | null: false, foreign_key: true |
| current_address_block        | references | null: false, foreign_key: true |
| current_address_building     | references | null: false, foreign_key: true |
| current_telephone_number     | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :purchase_record
