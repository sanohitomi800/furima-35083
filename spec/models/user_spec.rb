require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe '新規登録/ユーザー情報' do
    context '新規登録できるとき' do
      it '全ての項目の入力があれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが一致また６文字以上(英数字混合)なら登録できる' do
        @user.password = '000abc'
        @user.password_confirmation = '000abc'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'emailに＠がなければ登録できない' do
        @user.email = 'email'
        @user.valid?
        
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it 'passwordがなければ登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが５文字以下なら登録できない' do
        @user.password = '12abc'
        @user.password_confirmation = '12abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'passwordは半角英数混合でないと登録できない' do
        @user.password = '000000'
        @user.valid?
        
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordはアルファベットのみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?

        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passewordは全角英数字では登録できない' do
        @user.password = 'AAABBB'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '12345a'
        @user.password_confirmation = '12346a'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
    end
  end
  describe '新規登録/本人確認情報' do
    context '新規登録できないとき' do
      it 'ユーザー本名は、名字がなければ登録できない' do
        @user.fast_name = ''
        @user.valid?
        
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'ユーザー本名は、名字が存在しても名前がなければ登録できない' do
        @user.fast_name = '山田'
        @user.last_name = ''
        @user.valid?
        
        expect(@user.errors.full_messages).to include("名字を入力してください")
      end
      it '名字は、全角（漢字・ひらがな・カタカナ）での入力でなければ登録できない' do
        @user.fast_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は不正な値です")
      end
      it '名前は、全角（漢字・ひらがな・カタカナ）での入力でなければ登録できない' do
        @user.last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("名字は不正な値です")
      end
      it 'フリガナ（名字）が空だと登録できない' do
        @user.fast_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(カナ)を入力してください")
      end
      it 'フリガナ（名前）が空だと登録できない' do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名字(カナ)を入力してください")
      end
      it '名字のフリガナは全角（カタカナ）でなければ登録できない' do
        @user.fast_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(カナ)は不正な値です")
      end
      it '名前のフリガナは全角（カタカナ）でなければ登録できない' do
        @user.last_name_kana = 'りくたろう'
        @user.valid?
        expect(@user.errors.full_messages).to include("名字(カナ)は不正な値です")
      end
      it '生年月日が空だと登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
    end
  end
end
