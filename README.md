# README
## users テーブル

|Column|Type|Options|
|------------------------|-----------| -------------------------|
|nickname                |  string   | null: false              |
|email                   |  string   | null: false  unique: true|
|encrypted_password      |  string   | null: false              |
|last_name               |  string   | null: false              | 
|fast_name               |  string   | null: false              |
|last_name_kana          |  string   | null: false              |
|fast_name_kana          |  string   | null: false              |
|birthday                |  date     | null: false              |


### Association
- has_many :items
- has_many :purchases


## items テーブル

|     Column      |  Type     |   Options        |
|---------------- |-----------|-----------       |
| name            | integer   | null: false      |
| info            | text      | null: false      |
| category_id     | integer   | null: false      |
| status_id       | integer   | null: false      |
| shipping_fee_id | integer   | null: false      | 
| prefecture_id   | integer   | null: false      |
| days_id         | integer   | null: false      |          
| price           | integer   | null: false      |
| user            | references|foreign_key: true |
### Association

- belongs_to :user
- has_one :purchase
 

## address テーブル

|     Column       |  Type     |   Option         |
|----------------  |-----------|------------------|
| postalcoad       |  string   | null: false      | 
| prefecture_id    |  string   | null: false      |
| city             |  string   | null: false      | 
| addresses        |  string   | null: false      |
| apartment        |  string   |                  |
| phon_number      |  string   | null: false      |
| purchase         | references| foreign_key: true

### Association 
- belongs_to :purchase



## purchases テーブル
|     Column       |  Type     |   Options        |
|----------------  |-----------|----------------- |
| user             | references|foreign_key: true |
| item             | references|foreign_key: true |

### Association 
- belongs_to :user
- belongs_to :item
- has_one :addres 