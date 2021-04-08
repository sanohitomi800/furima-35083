require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
    describe '新規登録/ユーザー情報' do
      it 'nicknameがあれば登録できる' do
      end     
      it 'nicknameが空では登録できない' do
      end
      it 'emailがあれば登録できる' do
      end
      it 'emailが空では登録できない' do
      end
      it '重複したemailが存在する場合登録できない' do
      end
      it 'emailに＠がなければ登録できない' do
      end
      it 'passwordがなければ登録できない' do
      end
      it 'passwordが6文字以上であれば登録できる' do
      end
      it 'passwordが５文字以下なら登録できない' do
      end
      it 'passwordは半角英数混合なら登録できる' do
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do 
      end
    end  
  
    describe '新規登録/本人確認情報' do
      it 'ユーザー本名は、名字と名前があれば登録できる' do
      end
      it 'ユーザー本名は、名字が存在しても名前がなければ登録できない' do
      end
      it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力があれば登録できる' do
      end
      it 'ユーザー本名のフリガナは、名字と名前があれば登録できる' do 
      end
      it 'ユーザー本名のフリガナは、名字が存在しても名前がなければ登録できない' do
      end 
      it 'ユーザー本名のフリガナは、全角（カタカナ）であれば登録できる' do 
      end
      it '生年月日があれば登録できる' do
      end
    end
  end
end 

