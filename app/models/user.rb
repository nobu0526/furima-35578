class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :password, format: { with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  
  with_options presence:true do
    validates :birthday
    validates :nickname

    with_options presence:true, format: {with:/\A[ぁ-んァ-ン一-龥]+\z/} do
      validates :first_name
      validates :last_name
    end

    with_options presence: true, format: {with:/\A[ァ-ヶー－]+\z/} do
    validates :first_name_kana
    validates :last_name_kana
    end
  end

  has_many :items
  has_many :orders
  

end
