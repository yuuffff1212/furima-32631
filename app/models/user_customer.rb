class UserCustomer
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :shipping_region_id, :city, :house_number, :building_number, :tell, :user_id, :item_id

  with_options presence:true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :shipping_region_id, numericality: { other_than: 0 } 
    validates :city
    validates :house_number
    validates :tell, length: { maximum: 11 }
    validates :user_id
    validates :item_id
    #validates :token
  end
  #validates :tell, length: { maximum: 11 }
  validates :tell, numericality: {message: "Input only number"}

  def save
    customer = Customer.create!(user_id: user_id, item_id: item_id)
    Address.create!(postal_code: postal_code, city: city, house_number: house_number, building_number: building_number, tell: tell, shipping_region_id: shipping_region_id, customer_id: customer.id)
  end
end