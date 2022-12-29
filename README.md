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
| nickname                     | string | null: false,              |
| email                        | string | null: false, unique: true |
| encrypted_password           | string | null: false               |
| first_name                   | string | null: false               |
| first_name_kana              | string | null: false               |
| last_name                    | string | null: false               |
| last_name_kana               | string | null: false               |
| birth_date                   | date   | null: false               |


### Association
- has_many :items
- has_many :purchase_records

## itemsテーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | -------------------------------|
| item_name                  | text       | null: false                    |
| product_description        | text       | null: false                    |
| item_category_id           | integer    | null: false                    |
| item_state_id              | integer    | null: false                    |
| item_price                 | integer    | null: false                    |
| delivery_charge_burden_id  | integer    | null: false                    |
| days_up_to_delivery_id     | integer    | null: false                    |
| delivery_prefectures_id    | integer    | null: false                    |
| nickname                   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase_records


## purchase_recordsテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| item_name             | references | null: false, foreign_key: true |
| nickname              | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item


## delivery_address_multiplesテーブル
| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| postal_code_id          | integer    | null: false                    |
| address_prefectures_id  | references | null: false, foreign_key: true |
| address_municipality    | string     | null: false                    |
| address_block           | string     | null: false                    |
| address_building        | string     |                                |
| telephone_number        | string     | null: false                    |
| nickname                | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase_record
