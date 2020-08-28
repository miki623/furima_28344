class DealTransaction

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipping_area_id, :city, :house_number, :building_name, :phone_number, :token
  
    
  VALID_POSTAL_REGIX = /\A\d{3}[-]\d{4}\z/
  VALID_PHONE_REGIX = /\A\d{,11}\z/


  with_options presence: true do
    validates :postal_code, format: { with: VALID_POSTAL_REGIX, message: " Input correctly"}
    validates :shipping_area_id
    validates :city
    validates :token
    validates :house_number
    validates :phone_number, format: { with: VALID_PHONE_REGIX, message: "can't be blank"}
  end


  def save
    deal = Deal.create(user_id: user_id, item_id: item_id)
    
    Transaction.create(deal_id: deal.id, postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, house_number: house_number,
    building_name: building_name, phone_number: phone_number)
  end

  
end