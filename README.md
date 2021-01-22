# テーブル設計

##  users テーブル

| Column             | Type     | Options                   |
| ------------------ | -------- | --------------------------|
| nickname           | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| first_name         | string   | null: false               |
| last_name          | string   | null: false               |
| first_name_kana    | string   | null: false               |
| last_name_kana     | string   | null: false               |
| birthday           | date     | null: false               |

### Association

- has_many  :items
- has_many   :customers

## customer テーブル

| Column   | Type       | Options           |
| -------- | ---------- | ------------------|
| item     | references | foreign_key: true |
| user     | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one   :donation

## donation テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ------------------|
| postal_code        | string     | null: false       |
| shipping_region_id | integer    | null: false       |
| city               | string     | null: false       |
| house_number       | string     | null: false       |
| building_number    | string     |                   |
| tell               | string     | null: false       |
| customer           | references | foreign_key: true |

### Association

- belongs_to :customer

## item テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ------------------|
| name               | string     | null: false       |
| text               | text       | null: false       |
| price              | integer    | null: false       |
| item_category_id   | integer    | null: false       |
| item_state_id      | integer    | null: false       |
| shipping_cost_id   | integer    | null: false       |
| shipping_region_id | integer    | null: false       |
| shipping_date_id   | integer    | null: false       |
| user               | references | foreign_key: true |

## Association

- belongs_to :user
- has_one :customer
