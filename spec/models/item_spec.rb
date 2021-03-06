require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品について' do
    context '出品できるとき' do
      it '全ての項目に情報があれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できないとき' do
      it '商品画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it '商品名がないと出品できない' do
        @item.name = ''
        @item.valid?
        
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品説明がないと出品できない' do
        @item.info = ''
        @item.valid?
        
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'カテゴリーの情報がないと出品できない' do
        @item.category_id = ''
        @item.valid?
        binding.pry
        expect(@item.errors.full_messages).to include("カテゴリーは数値で入力してください")
      end
      it 'カテゴリーの情報で---が選択されている場合出品できない' do
        @item.category_id = 1
        @item.valid?
       
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it '商品の状態について情報がないと出品できない' do
        @item.status_id = ''
        @item.valid?
       
        expect(@item.errors.full_messages).to include("商品の状態は数値で入力してください")
      end
      it '商品の状態について---が選択されている場合、出品できない' do
        @item.status_id = 1
        @item.valid?
      
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it '配送料の負担について情報がないと出品できない' do
        @item.shipping_fee_id = ''
        @item.valid?
          
        expect(@item.errors.full_messages).to include("配送料の負担は数値で入力してください")
      end
      it '配送料の負担について---が選択されている場合出品できない' do
        @item.shipping_fee_id = 1
        @item.valid?
       binding.pry 
        expect(@item.errors.full_messages).to include("配送料の負担は1以外の値にしてください")
      end
      it '配送元の地域について情報がないと出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        
        expect(@item.errors.full_messages).to include("発送元の地域は数値で入力してください")
      end
      it '配送元の地域について---が選択されている場合出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        
        expect(@item.errors.full_messages).to include("発送元の地域は1以外の値にしてください")
      end
      it '発送までの日数についての情報がないと出品できない' do
        @item.day_id = ''
        @item.valid?
          
        expect(@item.errors.full_messages).to include("発送までの日数は数値で入力してください")
      end
      it '発送までの日数について---が選択されている場合出品できない' do
        @item.day_id = 1
        @item.valid?
        
        expect(@item.errors.full_messages).to include("発送までの日数は1以外の値にしてください")
      end
      it '販売価格の情報がないと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end

      it '販売価格が¥300より少ない時は出品できない' do
        @item.price = 299
        @item.valid?
        
        expect(@item.errors.full_messages).to include("販売価格は299より大きい値にしてください")
      end
      it '販売価格が¥9999999より多い時は出品できない' do
        @item.price = 10_000_000
        @item.valid?
        
        expect(@item.errors.full_messages).to include("販売価格は10000000より小さい値にしてください")
      end
      it '販売価格は半角英数字でないと出品できない' do
        @item.price = '１２３４５'
        @item.valid?
        
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
      it '販売価格半角英数混合では出品できない' do
        @item.price = '300abcde'
        @item.valid?
       
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
      it '販売価格は半角英語だけでは出品できない' do
        @item.price = 'abcdefg'
        @item.valid? 
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
    end
  end
end
