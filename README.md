# Furima-app テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ----------------   | ------ | ----------               |
| nickname           | string | null : false             | 
| email              | string | null : false  unique:true| 
| encrypted_password | string | null : false             | 
| family_name        | string | null : false             | 
| first_name         | string | null : false             | 
| family_name_kana   | string | null : false             | 
| first_name_kana    | string | null : false             | 
| birth_day          | date   | null : false             | 

### ssociation
has_many   :items dependent: :destroy
belongs_to :customer 


## items テーブル

| Column         | Type    | Options                        |
| ---------------| --------| -----------------------------  |
| name           | string  | null : false                   | 
| description    | string  | null : false                   | 
| price          | string  | null : false                   |  
| status_id      | integer | null : false                   | 
| cost_id        | integer | null : false                   | 
| area_id        | integer | null : false                   | 
| delivery_id    | integer | null : false                   | 
| user_id        | integer | null : false  foreign_key: true| 

### association
belongs_to :user 

## purchases テーブル

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
has_one :purchases_history


## purchases_history テーブル

| Column        | Type    | Options                        |
| ------------- | --------| ----------------------------   |
| user-id       | integer | null : false  foreign_key: true| 
| item-id       | integer | null : false  foreign_key: true| 






