# Furima-app テーブル設計

## users テーブル

| Column           | Type   | Options      |
| ---------------- | ------ | ----------   |
| nickname         | string | null : false | 
| email            | string | null : false | 
| password         | string | null : false | 
| family_name      | string | null : false | 
| first_name       | string | null : false | 
| family_name_kana | string | null : false | 
| first_name_kana  | string | null : false | 
| birth_day        | data   | null : false | 

### ssociation
has_many   :items dependent: :destroy
belongs_to :customer dependent: :destroy


## items テーブル

| Column           | Type    | Options                        |
| ---------------- | --------| ----------------------------   |
| item_name        | string  | null : false                   | 
| item_image       | string  | null : false                   | 
| item_description | string  | null : false                   | 
| item_price       | string  | null : false                   |  
| item_status      | string  | null : false                   | 
| item_cost        | string  | null : false                   | 
| item_area        | string  | null : false                   | 
| item_delivery    | string  | null : false                   | 
| user-id          | integer | null : false  foreign_key: true| 

### association
belongs_to :user 

## customer テーブル

| Column        | Type    | Options                        |
| ------------- | --------| ----------------------------   |
| name          | string  | null : false                   | 
| post_code     | string  | null : false                   | 
| prefecture    | string  | null : false                   | 
| city          | string  | null : false                   |  
| address       | string  | null : false                   | 
| building_name | string  | null : false                   | 
| phone_number  | string  | null : false                   | 
| user-id       | integer | null : false  foreign_key: true| 

### association
belongs_to :user




