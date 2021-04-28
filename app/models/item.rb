class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :day

  validates :name, presence: true,
                   length: { maximum: 40 }
  validates :info, presence: true,
                   length: { maximum: 1_000 }
  validates :image, presence: true

  with_options presence: true, format: { with: /\A[0-9a-zA-Z]*\z/ } do
    validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }
  end
  validates :price, numericality: true
  with_options numericality: { other_than: 1, message: "を入力してください" } do
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :day_id
  end
  belongs_to :user
  has_one_attached :image
   has_one :purchase
end
