class UserCustomer
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :shipping_region_id, :city, :house_number, :building_number, :tell

  with_options presence:true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :shipping_region_id
    validates :city
    validates :house_number
    validates :building_number
    validates :tell
    validates :token
  end
  validates :tell, length: { maximum: 11 }

  def save
    Address.create(postal_code: postal_code, city: city, house_number: house_number, :building_number: building_number, tell: tell)
    ShippingRegion.create(shipping_region_id: shipping_region_id)
  end
end