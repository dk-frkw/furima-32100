＃テーブル設計

## usersテーブル
| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| nickname          | string | null: false |
| email             | string | null: false |
| password          | string | null: false |
| last_name         | string | null: false |
| first_name        | string | null: false |
| last_name_kana    | string | null: false |
| birth_date        | date   | null: false |

### Association
- has_many :items
- has_many :shipping_address

## itemsテーブル
| Column            | Type         | Options                        |
| ------------------| ------------ | ------------------------------ |
| name              | string       | null: false                    |
| explanation       | text         | null: false                    |
| category_id       | integer      | null: false                    |
| condition_id      | integer      | null: false                    |
| delivery_fee_id   | integer      | null: false                    |
| delivery_area_id  | integer      | null: false                    |
| delivery_days_id  | integer      | null: false                    |
| price             | integer      | null: false                    |
| user_id           | references   | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :shipping_address

## shipping_addressテーブル
| Column          | Type         | Options                        |
| --------------- | ------------ | ------------------------------ |
| postal_code     | integer      | null: false                    |
| prefectures_id  | integer      | null: false                    |
| municipality    | string       | null: false                    |
| address         | string       | null: false                    |
| building_name   | string       |                                |
| phone_number    | string       | null: false                    |
| user_id         | references   | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :items