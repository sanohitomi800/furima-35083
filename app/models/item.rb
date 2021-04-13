class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :status
    belongs_to :shipping_fee
    belongs_to :prefecture
    belongs_to :day
    #空の投稿を保存できないようにする
    validates :name, presence: true,
                     length: { maximum: 40 }
    validates :info, presence: true,
                      length: { maximum: 1_000 }
    validates :image, presence: true
    
    with_options presence: true, format: {with: /\A[0-9a-zA-Z]*\z/} do
    validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9_999_999 }
  end  
    
    #カテゴリーの選択が「--」の時は保存できないようにする
    validates :category_id, numericality: { other_than: 1 } 
    validates :status_id, numericality:{ other_than: 1 }
    validates :shipping_fee_id, numericality:{ other_than: 1 }
    validates :prefecture_id, numericality:{ other_than: 1 }
    validates :day_id, numericality:{ other_than: 1 }  
    
    
    belongs_to :user
    has_one_attached :image
 #has_one :purchase


end
