# README
## users テーブル

|Column|Type|Options|
|------------------------|-----------| ------------|
|nickname                |  string   | null: false |
|email                   |  string   | unique: true|
|password                |  string   | null: false |
|password_confirmation   |  string   | null: false |
|last_name               |  string   | null: false | 
|fast_name               |  string   | null: false |
|last_name_kana          |  string   | null: false |
|fast_name_kana          |  string   | null: false |
|birthday                |  date     | null: false |


### Association
- has_many :items
- has_many :purchases
- has_one :address


## items テーブル

|     Column      |  Type     |   Options        |
|---------------- |-----------|-----------       |
| name            | integer   | null: false      |
| info            | text      | null: false      |
| category        | string    | null: false      |
| salesk_status   | integer   | null: false      |
| shipping_fee    | integer   | null: false      | 
| prefecture      | integer   | null: false      |
| days            | integer   | null: false      |          
| price           | integer   | null: false      |
| user            | references|foreign_key: true |
### Association

- belongs_to :user
- has_one    :purchase
- has_one    :address 

## address テーブル

|     Column       |  Type     |   Options   |
|----------------  |-----------|-----------  |
| postalcoad       |  string   | null: false | 
| prefecture       |  string   | null: false |
| city             |  string   | null: false | 
| addresses        |  string   | null: false |
| apartment        |  string   |             |
| phon_number      |  string   | null: false |
 

### Association 
- belongs_to :user
- belongs_to :items
- has_one :purchases


## purchases テーブル
|     Column       |  Type     |   Options        |
|----------------  |-----------|----------------- |
| name             | string    | null: false      |
| item             | string    | null: false      |
| user             | references|foreign_key: true |
| item             | references|foreign_key: true |

### Association 
- belongs_to :user
- belongs_to :user
- belongs_to :address 