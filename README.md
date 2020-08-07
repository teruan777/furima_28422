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
| birthday              | date    | null: false |


### Association
- has_many :items
- has_oen  :buyer
## itemsテーブル

| Colums          | Type       | Options                   |
|---------------- | ---------- | ------------------------- |
| item            | string     | null: false               |
| image           | string     | null: false               |
| text            | text       |                           |
| price           | integer    | null: false               |
| user_id         | references | null: false, foreign_key: |

### Association
- belongs_to :user

## buyerテーブル

| Colums        | Type       | Options                   |
| ------------- | ---------- | ------------------------- |
| postal_code   | string     | null: false               |
| city          | string     | null: false               |
| address       | integer    | null: false               |
| building_name | string     |                           |
| pone          | string     | null: false               |
| user_id       | references | null: false, foreign_key: |

### Association
belongs_to :buyer
