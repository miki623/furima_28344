# テーブル設計

## users テーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| nickname          | string | null: false |
| email             | string | null: false |
| password          | string | null: false |
| first_name        | string | null: false |
| last_name         | string | null: false |
| first_name_kana   | string | null: false |
| last_name_kana    | string | null: false |
| birth_date        | date   | null: false |

### Association

- has_many :items
- has_many :deals


## items テーブル

| Column              | Type    | Options                        |
| ------------------- | ------- | ------------------------------ |
| user_id             | string  | null: false, foreign_key: true |
| name                | string  | null: false                    |
| info                | string  | null: false                    |
| category            | integer | null: false                    |
| sales_status        | integer | null: false                    |
| delivery_fee        | integer | null: false                    |
| shipping_area       | integer | null: false                    |
| scheduled_delivery  | integer | null: false                    |
| price               | string  | null: false                    |

### Association

- belongs_to :user
- has_one :deal
- has_one_attached :image
- has_one :category
- has_one :sales_status
- has_one :delivery_fee
- has_one :scheduled_delivery
- has_one :shipping_area

## deals テーブル

| Column      | Type    | Options                        |
| ----------- | ------- | ------------------------------ |
| user_id     | string  | null: false, foreign_key: true |
| buyer_id    | string  | null: false, foreign_key: true |
| item_id     | string  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipment

## shipments テーブル

| Column              | Type    | Options                        |
| ------------------- | ------- | ------------------------------ |
| deal_id             | string  | null: false, foreign_key: true |
| postal_code         | string  | null: false                    |
| shipping_area       | integer | null: false                    |
| city                | string  | null: false                    |
| house_number        | string  | null: false                    |
| building_name       | string  | null: false                    |
| phone_number        | string  | null: false                    |

### Association

has_one :card
belongs_to :deal
