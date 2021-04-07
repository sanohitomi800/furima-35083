# README
## users テーブル

|Column|Type|Options|
|------------------------|-----------| ------------|
|nickname                |  string   | null: false |
|email                   |  string   | null: false |
|password                |  string   | null: false |
|password_confirmation   |  string   | null: false |
|last_name               |  string   | null: false | 
|fast_name               |  string   | null: false |
|last_name_kana          |  string   | null: false |
|fast_name_kana          |  string   | null: false |
|birthday_year           |  integer  | null: false |
|birthday_month          |  integer  | null: false |
|birthday_day            |  integer  | null: false |


### Association
- has_many :items
- has_many :purchases


## items テーブル

|     Column      |  Type     |   Options   |
|---------------- |-----------|-----------  |
| name            |  text     | null: false |
| info            |  text     | null: false |
| category        | string    | null: false |
| salesk_status   | string    | null: false |
| shipping_fee    | string    | null: false | 
| price           | string    | null: false |
| days            | string    | null: false |          


### Association

- belongs_to :user
- has_one    :purchase


## purchases テーブル

|     Column      |  Type     |   Options   |
|---------------- |-----------|-----------  |
| postalcoad      |  string   | null: false | 
| prefecture      |  string   | null: false |
| city            |  string   | null: false | 
| addresses       |  string   | null: false |
|apartment        |  string   |             |
|phon_number      |  integer  | null: false |
 

### Association 
- belongs_to :user
- belongs_to ;item