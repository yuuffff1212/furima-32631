class Customer < ApplicationRecord
  has_one :address
  belongs_to :user
  belongs_to :items
end
