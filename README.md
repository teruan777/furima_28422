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

## userテーブル

| Colums                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | steing  | null: false |
| encrypted_password    | string  | null: false |
| familyname_kanji      | string  | null: false |
| firstname_kanji       | string  | null: false |
| familyname_katakana   | string  | null: false |
| firstname_katakana    | string  | null: false |
| birthday              | date    | null: false |


### Association
- has_many :items
- has_many :purchases
- has_many :keeps
## itemテーブル

| Colums             | Type       | Options                   |
|------------------- | ---------- | ------------------------- |
| item               | string     | null: false               |
| image              | string     | null: false               |
| text               | text       | null: false               |
| category_id        | integer    | null: false               |
| status_id          | integer    | null: false               |
| delivery_burden_id | integer    | null: false               |
| shipping_origin_id | integer    | null: false               |
| arrival_day_id     | integer    | null: false               |
| price              | integer    | null: false               |
| user               | references | null: false, foreign_key: |
| buy                | boolean    |                           |



### Association
- belongs_to :user
- has_one    :purchase
- has_many :keep

## purchaseテーブル
| Colums | Type       | Option                    |
| ------ | ---------- | ------------------------- |
| user   | references | null: false, foreign_key: |
| item   | references | null: false, foreign_key: |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :house_add

## house_addテーブル

| Colums             | Type       | Options                   |
| ------------------ | ---------- | ------------------------- |
| postal_code        | string     | null: false               |
| shipping_origin_id | integer    | null: false               |
| city               | string     | null: false               |
| address            | string     | null: false               |
| building_name      | string     |                           |
| phone              | string     | null: false               |
| purchase           | references | null: false, foreign_key: |

### Association
- belongs_to :purchase


## keepテーブル
| Colums | Type       | Option                    |
| ------ | ---------- | ------------------------- |
| user   | references | null: false, foreign_key: |
| item   | refetences | null: false, foreign_key: |

### Association
- belongs_to :user
- belongs_to :item

