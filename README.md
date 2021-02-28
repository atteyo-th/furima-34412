# Furima-app テーブル設計

## users テーブル(利用者)

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

### association
has_many :items 
has_many :purchases_history
 


## items テーブル'(出品商品)

| Column         | Type    | Options                        |
| ---------------| --------| -----------------------------  |
| name           | string  | null : false                   | 
| description    | text    | null : false                   | 
| price          | integer | null : false                   |  
| status_id      | integer | null : false                   | 
| cost_id        | integer | null : false                   | 
| area_id        | integer | null : false                   | 
| delivery_id    | integer | null : false                   | 
| category_id    | integer | null : false                   | 
| user_id        | integer | null : false  foreign_key: true| 

### association
belongs_to :user 
has_one :purchases_history

## purchases テーブル(購入者)

| Column              | Type    | Options                        |
| ------------------- | --------| ----------------------------   |
| post_code           | string  | null : false                   | 
| area_id             | integer | null : false                   | 
| city                | string  | null : false                   |    
| address             | string  | null : false                   | 
| building_name       | string  |                                | 
| phone_number        | string  | null : false                   | 
| purchase_history_id | integer | null : false  foreign_key: true| 

### association
belongs_to :purchases_history


## purchases_history テーブル(購入履歴)

| Column        | Type    | Options                        |
| ------------- | --------| ----------------------------   |
| user_id       | integer | null : false  foreign_key: true| 
| item_id       | integer | null : false  foreign_key: true| 

### association
belongs_to :user
belongs_to :item
has_one :purchase







