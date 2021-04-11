class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :status
    belongs_to :shipping_fee
    belongs_to :prefecture
    belongs_to :days
    #空の投稿を保存できないようにする
    validates :name, :info, :price, presence: true 

    #カテゴリーの選択が「--」の時は保存できないようにする
    validates :category_id, numericality: { other_than: 1 } 
    validates :status_id, numericality:{ other_than: 1 }
    validates :shipping_fee, numericality:{ other_than: 1 }
    validates :prefecture, numericality:{ other_than: 1 }
    validates :days, numericality:{ other_than: 1 }  
    
    
    belongs_to :user
    has_one_attached :image
#has_one :purchase


end
