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


### Association
- has_many :items
- has_many :purchase_records

## itemsテーブル

| Column                     | Type   | Options     |
| -------------------------- | ------ | ------------|
| item_name                  | text   | null: false |
| item_image                 | image  | null: false |
| product_description        | text   | null: false |
| item_category              | text   | null: false |
| item_state                 | text   | null: false |
| item_price                 | string | null: false |
| sales_fee                  | string | null: false |
| sales_profit               | string | null: false |
| delivery_charge_burden     | string | null: false |
| days_up_to_delivery        | string | null: false |
| delivery_area              | string | null: false |

### Association
- belongs_to :user
- belongs_to :purchase_records


## purchase_recordsテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| item_name             | references | null: false, foreign_key: true |
| item_image            | references | null: false, foreign_key: true |
| item_price            | references | null: false, foreign_key: true |
| card_information      | string     | null: false                    |
| expiration_date_year  | string     | null: false                    |
| expiration_date_month | string     | null: false                    |
| security_code         | string     | null: false                    |

### Association
- belongs_to :user
- belongs_to :item


## delivery_address_multiplesテーブル
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| postal_code          | string     | null: false                    |
| address_prefectures  | text       | null: false                    |
| address_municipality | text       | null: false                    |
| address_block        | string     | null: false                    |
| address_building     | text       | null: false                    |
| telephone_number     | string     | null: false                    |

### Association
- belongs_to :purchase_record
