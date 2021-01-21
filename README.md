# テーブル設計

##  users テーブル

| Column          | Type     | Options     |
| --------------- | -------- | ----------- |
| email           | string   | null: false |
| password        | string   | null: false |
| first_name      | string   | null: false |
| last_name       | string   | null: false |
| first_name_kana | string   | null: false |
| last_name_kana  | string   | null: false |
| birthday        | date     | null: false |

### Association

- has_many  :item
- has_one   :customer

## customer テーブル

| Column          | Type       | Options     |
| ---------       | ---------- | ------------|
| first_name      | string     | null: false |
| last_name       | string     | null: false |
| first_name_kana | string     | null: false |
| last_name_kana  | string     | null: false |
| user            | references | foreign_key |

### Association

- belong_to :user
- has_one   :donation

## donation テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ------------|
| potal_code      | string     | null: false |
| prefecture      | string     | null: false |
| city            | string     | null: false |
| house_number    | string     | null: false |
| building_number | string     | null: false |
| tell            | integer    | null: false |
| customer        | references | foreign_key |

### Association

- belong_to :costomer

## item テーブル

| Column  | Type       | Options     |
| --------| ---------- | ------------|
| name    | string     | null: false |
| text    | text       | null: false |
| price   | integer    | null: false |
| user    | references | foreign_key |

## Association

- belong_to :user
