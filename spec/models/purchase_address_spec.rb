require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @purchase_address = FactoryBot.build(:purchase_address, item_id: item.id, user_id: user.id) 
    
    end

    context '内容に問題ない場合' do
      
      it '電話番号は11桁以内であれば保存できること' do
        @purchase_address.phon_number = '09012345678'
        expect(@purchase_address).to be_valid
      end
    
    end
    context '内容に問題がある場合' do
      
    it '郵便番号情報がないと購入できない' do 
      @purchase_address.postalcoad = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postalcoad can't be blank")
    end
    it '郵便番号はハイフンが無いと購入できない' do
      @purchase_address.postalcoad = '1234567'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postalcoad is invalid. Include hyphen(-)")
    end
      
    it '都道府県情報がないと購入できない' do 
      @purchase_address.prefecture_id = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      
    end
    it '市町村情報がないと購入できない' do 
      @purchase_address.city = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("City can't be blank")
    end
    it '電話番号がないと購入できない' do 
      @purchase_address.phon_number = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phon number is invalid")
    end   
    it '電話番号が12桁以上だと購入できない' do 
      @purchase_address.phon_number = "090123456789"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phon number is invalid")
    end  
    it 'クレジットカードの情報がないと決済できないこと' do
        @purchase_address.token = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
        
    end

    end
  end
end