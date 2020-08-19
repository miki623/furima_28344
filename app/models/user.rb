class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :buyers

  VALID_NAME_REGIX = /\A[ぁ-んァ-ン一-龥]/
  VALID_KANA_REGIX = /\A[ァ-ヶー－]+\z/

  with_options presence: true do
    validates :nickname
    validates :email
    validates :password, format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}
    validates :first_name, format: { with: VALID_NAME_REGIX, message: "is invalid. Input full-width characters."}
    validates :last_name, format: { with: VALID_NAME_REGIX, message: "is invalid. Input full-width characters."}
    validates :first_name_kana, format: { with: VALID_KANA_REGIX, message: "is invalid. Input full-width katakana characters."}
    validates :last_name_kana, format: { with: VALID_KANA_REGIX, message: "is invalid. Input full-width katakana characters."}
    validates :birth_date
  end
end
