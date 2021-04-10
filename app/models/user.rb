class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        with_options presence: true do
         validates :nickname
         validates :birthday
         validates :password,length:{minimum:6},format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/, message:"Password Include both letters and numbers"}
        end
        
        with_options presence:true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do 
        validates :last_name
        validates :fast_name
        end 
         
        with_options presence:true,format: {with: /\A[ァ-ヶー－]+\z/} do
        validates :last_name_kana
        validates :fast_name_kana   
        end
        
        # has_many :items
        # has_many :purchases
        
        
end

