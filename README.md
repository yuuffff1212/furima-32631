# テーブル設計

##  users テーブル

| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| nickname           | string   | null: false |
| email              | string   | unique: true|
| encrypted_password | string   | null: false |
| first_name         | string   | null: false |
| last_name          | string   | null: false |
| first_name_kana    | string   | null: false |
| last_name_kana     | string   | null: false |
| birthday           | date     | null: false |

### Association

- has_many  :items
- has_many   :customer

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

| Column          | Type       | Options           |
| --------------- | ---------- | ------------------|
| postal_code     | string     | null: false       |
| prefecture      | string     | null: false       |
| city            | string     | null: false       |
| house_number    | string     | null: false       |
| building_number | string     |                   |
| tell            | string     | null: false       |
| customer        | references | foreign_key: true |

### Association

- belongs_to :customer

## item テーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ------------------|
| name            | string     | null: false       |
| text            | text       | null: false       |
| price           | integer    | null: false       |
| item_category   | integer    | null: false       |
| item_state      | integer    | null: false       |
| shipping_cost   | integer    | null: false       |
| shipping_region | integer    | null: false       |
| shipping_date   | integer    | null: false       |
| user            | references | foreign_key: true |

## Association

- belongs_to :user
- has_one :customer
