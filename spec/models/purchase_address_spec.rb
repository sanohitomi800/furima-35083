require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @purchase_address = FactoryBot.build(:purchase_address, item_id: item.id, user_id: user.id) 
      sleep(1)
    end

    context '内容に問題ない場合' do
      
      it '全て記入してあれば保存できること' do
        expect(@purchase_address).to be_valid
      end
      it '建物名がなくても購入できる' do
        @purchase_address.apartment = ""
        expect(@purchase_address).to be_valid
      end
    
    end
    context '内容に問題がある場合' do
      
    it '郵便番号情報がないと購入できない' do 
      @purchase_address.postalcoad = ""
      @purchase_address.valid?
      
      expect(@purchase_address.errors.full_messages).to include("郵便番号を入力してください")
    end
    it '郵便番号はハイフンが無いと購入できない' do
      @purchase_address.postalcoad = '1234567'
      @purchase_address.valid?
     
      expect(@purchase_address.errors.full_messages).to include("郵便番号はハイフン(-)を入れて入力してください")
    
    end
      
    it '都道府県情報がないと購入できない' do 
      @purchase_address.prefecture_id = ""
      @purchase_address.valid?
      
      expect(@purchase_address.errors.full_messages).to include("発送元の地域を入力してください")
      end
    it '都道府県情報について---が選択されている場合出品できない' do 
      @purchase_address.prefecture_id = 1
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("発送元の地域を入力してください")
      
    end
    it '市町村情報がないと購入できない' do 
      @purchase_address.city = ""
      @purchase_address.valid?
      
      expect(@purchase_address.errors.full_messages).to include("市区町村を入力してください")
    end
    it '番地がないと購入できない' do
      @purchase_address.addresses = ""
      @purchase_address.valid?
      
      expect(@purchase_address.errors.full_messages).to include("番地を入力してください")
    end    
    
    it '電話番号がないと購入できない' do 
      @purchase_address.phon_number = ""
      @purchase_address.valid?
      
      expect(@purchase_address.errors.full_messages).to include("電話番号を入力してください")
    end   
    it '電話番号が12桁以上だと購入できない' do 
      @purchase_address.phon_number = "090123456789"
      @purchase_address.valid?
      
      expect(@purchase_address.errors.full_messages).to include("電話番号は不正な値です")
    end  
    it '電話番号に数字以外か入っていると購入できない' do
      @purchase_address.phon_number = "090123456abc"
      @purchase_address.valid?
      
      expect(@purchase_address.errors.full_messages).to include("電話番号は不正な値です")
    end
    it 'クレジットカードの情報がないと決済できないこと' do
        @purchase_address.token = ""
        @purchase_address.valid?
        
        expect(@purchase_address.errors.full_messages).to include("カード情報を入力してください")
    end
    it 'user_idがないと購入できない'do
        @purchase_address.user_id = ""
        @purchase_address.valid?
       
        expect(@purchase_address.errors.full_messages).to include("Userを入力してください")
    end 
    it 'item_idがないと購入できない' do
      @purchase_address.item_id = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Itemを入力してください")
    end
  end
  end
end