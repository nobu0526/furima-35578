## users table

| Column               | Type                | Options                 |
|----------------------|---------------------|-------------------------|
| nickname             | string              | null: false             |
| mail                 | string              | null: false             |
| password             | string              | null: false             |
| password_confirmation| string              | null: false             |
| first_name           | text                | null: false             |
| last_name            | text                | null: false             |
| first_name_kana      | text                | null: false             |
| last_name_kana       | text                | null: false             |
| birthday             | date                | null: false             |


### Association

* has_many :items
* has_many :cards

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| name                                | string     | null: false       |
| description                         | string     | null: false       |
| category                            | string     | null: false       |
| status                              | string     | null: false       |
| price                               | string     | null: false       |
| shipping_id                         | reference  | null: false       |

### Association

- belongs_to :user
- has_one    :shipping
- has_one    :card

## cards table

| Column             | Type       | Options           |
|--------------------|------------|-------------------|
| card number        | string     | null: false       |
| expiration_date    | string     | null: false       |
| security_code      | string     | null: false       |
| shipping_address_id| reference  | null: false       |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :shipping_address

## shipping table

| Column            | Type       | Options           |
|-------------------|------------|-------------------|
| charges           | string     | null: false       |
| area              | string     | null: false       |
| days              |  string    | null: false       |

### Association

- belongs_to :item

## shipping_address table

| Column            | Type       | Options           |
|-------------------|------------|-------------------|
| post_code         | string     | null: false       |
| prefecture        | string     | null: false       |
| city              | string     | null: false       |
| address           | string     | null: false       |
| building_name     | string     | null: false       |
| phone_number      | string     | null: false       |

### Association

- belongs_to :card
