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

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| name                                | string     | null: false       |
| description                         | text       | null: false       |
| category                            | string     | null: false       |
| status                              | string     | null: false       |
| price                               | string     | null: false       |
| charges                             | string     | null: false       |
| area                                | string     | null: false       |
| days                                | string     | null: false       |
| users_id                            | reference  | null: false       |

### Association

- belongs_to :user
- belongs_to :order

## orders table

| Column            | Type       | Options           |
|-------------------|------------|-------------------|
| item_id           | reference  | null: false       |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping-address

## shipping_address table

| Column            | Type       | Options           |
|-------------------|------------|-------------------|
| post_code         | string     | null: false       |
| prefecture        | string     | null: false       |
| city              | string     | null: false       |
| address           | string     | null: false       |
| building_name     | string     |                   |
| phone_number      | string     | null: false       |

### Association

- belongs_to :order
