class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :deals

  VALID_NAME_REGIX = /\A[ぁ-んァ-ン一-龥]/
  VALID_KANA_REGIX = /\A[ァ-ヶー－]+\z/
  VALID_PASS_REGIX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

  with_options presence: true do
    validates :nickname
    validates :email
    validates :password, format: { with: VALID_PASS_REGIX, message: "は文字と数字の両方を含めてください"}
    validates :first_name, format: { with: VALID_NAME_REGIX, message: "は全角で入力してください"}
    validates :last_name, format: { with: VALID_NAME_REGIX, message: "は全角で入力してください"}
    validates :first_name_kana, format: { with: VALID_KANA_REGIX, message: "は全角カタカナで入力してください"}
    validates :last_name_kana, format: { with: VALID_KANA_REGIX, message: "は全角カタカナで入力してください"}
    validates :birth_date
  end
end
