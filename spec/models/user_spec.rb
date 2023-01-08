require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  # pending "add some examples to (or delete) #{__FILE__}"
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '正常に登録できる' do
        expect(@user).to be_valid
      end
      it 'first_nameとlast_nameが全角であれば登録できる' do
        @user.first_name = '翔平'
        @user.last_name = '大谷'
        expect(@user).to be_valid
      end
      it 'first_name_kanaとlast_name_kanaが全角であれば登録できる' do
        @user.first_name = 'ショウヘイ'
        @user.last_name = 'オオタニ'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空だと登録できない' do
        # user = FactoryBot.build(:user)
        @user.nickname = ''
        # user = User.new(nickname: '', email: 'kkk@gmail.com', password: '00000000', password_confirmation: '00000000', last_name: '山田', last_name_kana: 'ヤマダ', first_name: '太郎', first_name_kana: 'タロウ', birth_date: '1930-01-01')
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        # user = FactoryBot.build(:user)
        @user.email = ''
        # user = User.new(nickname: 'tarou', email: '', password: '00000000', password_confirmation: '00000000', last_name: '山田', last_name_kana: 'ヤマダ', first_name: '太郎', first_name_kana: 'タロウ', birth_date: '1930-01-01')
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        # user = User.new(nickname: 'tarou', email: 'kkk@gmail.com', password: '00000000', password_confirmation: '00000000', last_name: '山田', last_name_kana: 'ヤマダ', first_name: '太郎', first_name_kana: 'タロウ', birth_date: '1930-01-01')
        # @user.valid?
       expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        # user = User.new(nickname: 'tarou', email: 'kkkgmail.com', password: '00000000', password_confirmation: '00000000', last_name: '山田', last_name_kana: 'ヤマダ', first_name: '太郎', first_name_kana: 'タロウ', birth_date: '1930-01-01')
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        # user = User.new(nickname: 'tarou', email: 'kkk@gmail.com', password: '', password_confirmation: '00000000', last_name: '山田', last_name_kana: 'ヤマダ', first_name: '太郎', first_name_kana: 'タロウ', birth_date: '1930-01-01')
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        # user = User.new(nickname: 'tarou', email: '', password: '00000', password_confirmation: '00000', last_name: '山田', last_name_kana: 'ヤマダ', first_name: '太郎', first_name_kana: 'タロウ', birth_date: '1930-01-01')
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password ='123456'
        @user.password_confirmation = '1234567'
        # user = User.new(nickname: 'tarou', email: 'kkk@gmail.com', password: '12345678', password_confirmation: '22345678', last_name: '山田', last_name_kana: 'ヤマダ', first_name: '太郎', first_name_kana: 'タロウ', birth_date: '1930-01-01')
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'パスワードは、数字だけでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'パスワードは、英字だけでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードは、全角だと登録できない' do
        @user.password = 'ああああああ'
        @user.password_confirmation = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが半角では登録できない' do
        @user.first_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが半角では登録できない' do
        @user.last_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'first_name_kanaが半角では登録できない' do
        @user.first_name_kana = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角文字を使用してください")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'last_name_kanaが半角では登録できない' do
        @user.last_name_kana = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角文字を使用してください")
      end
      it '生年月日が空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
