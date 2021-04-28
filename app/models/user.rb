class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :password, length: { minimum: 6 },
                         format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/, message: "(確認)を入力してください" }
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角で入力してください" } do
    validates :last_name
    validates :fast_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ ,message:"は全角カナで入力してください"} do
    validates :last_name_kana
    validates :fast_name_kana
  end

  has_many :items
  # has_many :purchases
end
