# テーブル設計

## users テーブル

| Column             | Type    | Options                                                                                  |
| ------------------ | ------- | ---------------------------------------------------------------------------------------- |
| nickname           | string  | null: false, format: { with: /\A[a-z0-9]+\z/i }                                          |
| email              | string  | null: false                                                                              |
| encrypted_password | string  | null: false, length: { minimum: 6 },format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/}|
| name               | string  | null: false, format: { with: /\A[ぁ-んァ-ン一-龥々]/ }                                     |
| name_reading       | string  | null: false, format: { with: /\A[ァ-ヶー－]+\z/ }                                         |
| birthday           | integer | null: false, validates :genre_id, numericality: { other_than: 1 }                        |

### Association

- has_many :items
- has_many :record
- has_many :address

## items テーブル

| Column            | Type       | Options                                                                                                       |
| ----------------- | ---------- | ------------------------------------------------------------------------------------------------------------- |
| items_image       | string     | null: false                                                                                                   |
| items_name        | string     | null: false, length: { maximum: 40 }                                                                          |
| items_description | text       | null: false, length: { maximum: 1000 }                                                                        |
| category          | integer    | null: false, validates :genre_id, numericality: { other_than: 1 }                                             |
| condition         | integer    | null: false, validates :genre_id, numericality: { other_than: 1 }                                             |
| burden            | integer    | null: false, validates :genre_id, numericality: { other_than: 1 }                                             |
| shipping_area     | integer    | null: false, validates :genre_id, numericality: { other_than: 1 }                                             |
| Days_to_ship      | integer    | null: false, validates :genre_id, numericality: { other_than: 1 }                                             |
| price             | integer    | null: false, validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }|
| user              | references | null: false, foreign_key: true                                                                                |

### Association

belongs_to :user
belongs_to :items
has_one :record

## record テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :items
has_one :address

## address テーブル

| Column        | Type       | Options                                            |
| ------------- | ---------- | -------------------------------------------------- |
| postal_code   | string     | null: false                                        |
| prefecture    | integer    | null: false, format: { with: /\A\d{3}[-]\d{4}\z/ } |
| city          | string     | null: false                                        |
| house_number  | string     | null: false                                        |
| building_name | string     |                                                    |
| phone_number  | integer    | null: false                                        |
| user          | references | null: false, foreign_key: true                     |

### Association

belongs_to :user
belongs_to :items
belongs_to :record
