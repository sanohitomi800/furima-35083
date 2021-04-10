class Item < ApplicationRecord

  with_options presence: true do 
    validates :name
    validates :info
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :days_id
    validates :price 
  end

    belongs_to :user
    #has_one :purchase

end
