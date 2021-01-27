class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :shipping_cost
  belongs_to :shipping_date
  belongs_to :shipping_region
  belongs_to :item_category
  belongs_to :item_state

  with_options presence: true do
    validates :name
    validates :text
    validates :price, numericality: { message: " is invalid. Input half-width alphanumeric characters."}
    validates :shipping_region_id 
    validates :shipping_date_id
    validates :shipping_cost_id
    validates :item_state_id
    validates :item_category_id
    validates :image
  end

  validates :shipping_region_id, numericality: { other_than: 0 } 
  with_options numericality: { other_than: 1 } do
    validates :shipping_date_id
    validates :shipping_cost_id
    validates :item_category_id
    validates :item_state_id
  end
end
