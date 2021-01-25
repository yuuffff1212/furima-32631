class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  with_options presence: true do
    validates :nickname
    validates :password, format: {with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/, message: "is invalid. Include both letters and numbers." }
    validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥々]/, message: "is invalid. Input full-width characters." }
    validates :last_name, format: {with: /\A[ぁ-んァ-ン一-龥々]/, message: "is invalid. Input full-width characters." }
    validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters." }
    validates :last_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters." }
    validates :birthday
  end
end
