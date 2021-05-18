## users table

| Column               | Type                | Options                 |
|----------------------|---------------------|-------------------------|
| nickname             | string              | null: false             |
| email                | string              | null: false,unique:true |
| encrypted_password   | string              | null: false             |
| first_name           | string              | null: false             |
| last_name            | string              | null: false             |
| first_name_kana      | string              | null: false             |
| last_name_kana       | string              | null: false             |
| birthday             | date                | null: false             |


### Association

* has_many :items
* has_many :orders

## items table

| Column                              | Type       | Options                            |
|-------------------------------------|------------|------------------------------------|
| name                                | string     | null: false                        |
| description                         | text       | null: false                        |
| price                               | integer    | null: false                        |
| category_id                         | string     | null: false                        |
| status_id                           | string     | null: false                        |
| charges_id                          | string     | null: false                        |
| shipping_area_id                    | string     | null: false                        |
| shipping_day_id                    | string     | null: false                        |
| user                                | reference  | null: false ,foreign_key:true      |

### Association

- belongs_to :user
- has_one    :order

## orders table

| Column            | Type       | Options                            |
|-------------------|------------|------------------------------------|
| user              | reference  | null: false ,foreign_key:true      |
| item              | reference  | null: false ,foreign_key:true      |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping-address

## shipping_address table

| Column            | Type       | Options           |
|-------------------|------------|-------------------|
| post_code         | string     | null: false       |
| area_id           | string     | null: false       |
| city              | string     | null: false       |
| address           | string     | null: false       |
| building_name     | string     |                   |
| phone_number      | string     | null: false       |

### Association

- belongs_to :order
