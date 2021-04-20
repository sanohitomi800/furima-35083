class PurchaseAddress 
include ActiveModel::Model
attr_accessor :postalcoad, :prefecture_id, :city, :addresses, :apartment, :phon_number,:user_id, :item_id, :token

with_options presence: true do
  validates :postalcoad, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, numericality: { other_than: 1,  message: "can't be blank"}
  validates :city
  validates :addresses
  validates :phon_number, format: {with: /\A\d{11}\z/}
  validates :user_id
  validates :item_id
  validates :token
end

def save 
@purchase = Purchase.create(user_id: user_id, item_id: item_id )

Address.create(apartment: apartment, postalcoad: postalcoad, prefecture_id: prefecture_id, city: city, addresses: addresses, phon_number: phon_number, purchase_id: @purchase.id)
end


end