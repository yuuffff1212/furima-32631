class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items

  name_zenkaku_nihongo =  /\A[ぁ-んァ-ン一-龥々]/
  name_zenkaku_kana = /\A[ァ-ヶー－]+\z/

  with_options presence: true do
    validates :nickname
    validates :password, format: {with:/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "is invalid. Include both letters and numbers. Input half-width characters." }
    validates :first_name, format: {with: name_zenkaku_nihongo, message: "is invalid. Input full-width characters." }
    validates :last_name, format: {with: name_zenkaku_nihongo, message: "is invalid. Input full-width characters." }
    validates :first_name_kana, format: {with: name_zenkaku_kana, message: "is invalid. Input full-width katakana characters." }
    validates :last_name_kana, format: {with: name_zenkaku_kana, message: "is invalid. Input full-width katakana characters." }
    validates :birthday
  end
end
