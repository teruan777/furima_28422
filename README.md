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
| password              | string  | null: false |
| password_confirmation | string  | null: false |
| familyname_kanji      | string  | null: false |
| firstname_kanji       | string  | null: false |
| familyname_katakana   | string  | null: false |
| firstname_katakana    | string  | null: false |
| birthday_year         | integer | null: false |
| birthday_moon         | integer | null: false |
| birthday_day          | integer | null: false |

### Association
- has_many :items
- has_oen  :purchase
## itemsテーブル

| Colums          | Type       | Options                   |
|---------------- | ---------- | ------------------------- |
| item            | string     | null: false               |
| image           | string     | null: false               |
| text            | text       |                           |
| category        | string     | null: false               |
| status          | string     | null: false               |
| delivery_burden | string     | null: false               |
| shipping_origin | string     | null: false               |
| arrival_day     | string     | null: false               |
| price           | integer    | null: false               |
| user_id         | references | null: false, foreign_key: |

### Association
- belongs_to :user

## purchaseテーブル

| Colums        | Type       | Options                   |
| ------------- | ---------- | ------------------------- |
| card_data     | integer    | null: false               |
| deadline_moon | integer    | null: false               |
| deadline_year | integer    | null: false               |
| cvv2          | integer    | null: false               |
| user_id       | references | null: false, foreign_key: |

### Association
- belongs_to :user
- has_oen    :house_add

## house_addテーブル

| Colums        | Type       | Options                   |
| ------------- | ---------- | ------------------------- |
| postal_code   | integer    | null: false               |
| prefectures   | string     | null: false               |
| city          | string     | null: false               |
| address       | integer    | null: false               |
| building_name | string     |                           |
| pone          | integer    | null: false               |
| purchase_id   | references | null: false, foreign_key: |

### Association
belongs_to :purchase
