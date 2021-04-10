class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
         validates :nickname
         validates :last_name, format: {with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "Last name Full-width characters"}
         validates :fast_name,  format: {with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "Fast name Full-width characters"}
         validates :last_name_kana,format: {with: /\A[ァ-ヶー－]+\z/, message: "Last name kana Full-width katakana characters"} 
         validates :fast_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "Fast name kana Full-width katakana characters"}
         validates :birthday     
         validates :password,length:{minimum:6},format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/, message:"Password Include both letters and numbers"}
        end
        
        has_many :items
        has_many :purchases
        
        
end

