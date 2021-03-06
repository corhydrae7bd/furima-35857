# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_reading  | string  | null: false               |
| first_name_reading | string  | null: false               |
| birthday           | date    | null: false               |

### Association

- has_many :items
- has_many :records

## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| items_name        | string     | null: false                    |
| items_description | text       | null: false                    |
| category_id       | integer    | null: false                    |
| condition_id      | integer    | null: false                    |
| burden_id         | integer    | null: false                    |
| prefecture_id     | integer    | null: false                    |
| days_to_ship_id   | integer    | null: false                    |
| price             | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

belongs_to :user
has_one :record

## records テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item
has_one :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | -------------------------------|
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| record        | references | null: false, foreign_key: true |

### Association

belongs_to :record
