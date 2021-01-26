class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  bolongs_to :user
  belongs_to :shipping_cost_id
  belongs_to :shipping_date_id
  belongs_to :shipping_region_id
  belongs_to :item_category
  belongs_to :item_state_id

  with_options presence: true do
    validates :name
    validates :text
    validates :text
    validates :price format: {with: /\A[0-9]+\z/, message: " is invalid. Input half-width alphanumeric characters."}
    validates :shipping_region_id 
    validates :shipping_date_id
    validates :shipping_cost_id
    validates :item_state_id
    validates :item_category
    validates :image
  end

  validates :shipping_region_id, numericality: { other_than: 0 } 
  with_options numericality: { other_than: 1 } do
    validates :shipping_date_id
    validates :shipping_cost_id
    validates :item_category
    validates :item_state_id
  end
end
