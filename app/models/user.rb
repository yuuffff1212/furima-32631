class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  a =  /\A[ぁ-んァ-ン一-龥々]/
  b = /\A[ァ-ヶー－]+\z/

  with_options presence: true do
    validates :nickname
    validates :password, format: {with:/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "is invalid. Include both letters and numbers. Input half-width characters." }
    #validates :password, format: {with: \d, message: "is invalid. Input half-width characters."}
    validates :first_name, format: {with: a, message: "is invalid. Input full-width characters." }
    validates :last_name, format: {with: a, message: "is invalid. Input full-width characters." }
    validates :first_name_kana, format: {with: b, message: "is invalid. Input full-width katakana characters." }
    validates :last_name_kana, format: {with: b, message: "is invalid. Input full-width katakana characters." }
    validates :birthday
  end
end
