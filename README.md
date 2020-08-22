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

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| name                | string     | null: false                    |
| info                | text       | null: false                    |
| category            | integer    | null: false                    |
| sales_status        | integer    | null: false                    |
| delivery_fee        | integer    | null: false                    |
| shipping_area       | integer    | null: false                    |
| scheduled_delivery  | integer    | null: false                    |
| price               | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :deal
- has_one_attached :image
- belongs_to_active_hash :category
- belongs_to_active_hash :sales_status
- belongs_to_active_hash :delivery_fee
- belongs_to_active_hash :scheduled_delivery
- belongs_to_active_hash :shipping_area

## deals テーブル

| Column      | Type       | Options                         |
| ----------- | ---------- | ------------------------------- |
| user        | references | null: false,  foreign_key: true |
| item        | references | null: false,  foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipment

## shipments テーブル

| Column              | Type       | Options                         |
| ------------------- | ---------- | ------------------------------- |
| deal                | references | null: false, foreign_key: true  |
| postal_code         | string     | null: false                     |
| shipping_area       | integer    | null: false                     |
| city                | string     | null: false                     |
| house_number        | string     | null: false                     |
| building_name       | string     |                                 |
| phone_number        | string     | null: false                     |

### Association

- belongs_to :deal
- belongs_to_active_hash :shipping_area

