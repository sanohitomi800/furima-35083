class PurchaseAddress 
include AtiveModel::Model
attr_accessor :postalcoad, :prefecture_id, :city, :addresses, :apartment, :phon_number, :purchase_id, :user_id, :item_id

with_options presence: true do
  validates :postalcoad, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, numericality: { other_than: 1,  message: "can't be blank"}
  validates :city
  validates :addresses
  validates :phon_number, format: {with: /\A\d{11}\z/}
  validates :purchase_id
  validates :user_id
  validates :item_id
  
end
def save 
#誰がいつどの情報を購入したのか記録するテーブル
@purchase = Purchase.creat(user_id: user_id, item_id: item_id )#
#住所を保存する
ADDress.create(postalcoad: postalcoad, prefecture_id: prefecture_id, city: city, addresses: addresses, phon_number: phon_number, purchase_id: purchase_id)
end


end