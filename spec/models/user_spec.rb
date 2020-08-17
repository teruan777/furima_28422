require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    context '新規登録できるとき' do
      it '全ての項目が入っていてかつemailが@を含みデータベースのemailと重複していないかつパスワードは6文字以上の半角英数字混合でありかつkanjiの項目で苗字と名前が漢字か平仮名かカタカナが使われていてkatakanaの項目では苗字と名前がカタカナが使われていてかつ生年月日が入っていれば新規登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空の場合新規登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emaliが空の場合新規登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが既に登録されているemailと重複していた場合新規登録できない' do
        # binding.pry
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailで@が使用されてない場合新規登録できない' do
        @user.email = 'aaaa1111yahoo.co.jp'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空の場合新規登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwoldが全角の場合新規登録できない' do
        @user.password = 'ABC123'
        @user.password_confirmation = 'ABC123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwoldが半角アルファベットのみの場合新規登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwoldが半角数値のみの場合新規登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwoldが6文字を満たしてない場合新規登録できない' do
        @user.password = 'abc12'
        @user.password_confirmation = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwoldが存在してもpasswold_confirmationが空の場合新規登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'familyname_kanjiが空の場合新規登録できない' do
        @user.familyname_kanji = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Familyname kanji can't be blank")
      end
      it 'familyname_kanjiに数字が入っていた場合新規登録できない' do
        @user.familyname_kanji = '０田中'
        @user.valid?
        expect(@user.errors.full_messages).to include('Familyname kanji is invalid')
      end
      it 'familyname_kanjiに英語が入っていた場合新規登録できない' do
        @user.familyname_kanji = 'a田中'
        @user.valid?
        expect(@user.errors.full_messages).to include('Familyname kanji is invalid')
      end
      it 'familyname_kanjiに記号が入っていた場合新規登録できない' do
        @user.familyname_kanji = '！田中'
        @user.valid?
        expect(@user.errors.full_messages).to include('Familyname kanji is invalid')
      end
      it 'firstname_kanjiが空の場合新規登録できない' do
        @user.firstname_kanji = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kanji can't be blank")
      end
      it 'firstname_kanjiに数字が入っていた場合新規登録できない' do
        @user.firstname_kanji = '０凛'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname kanji is invalid')
      end
      it 'firstname_kanjiに英語が入っていた場合新規登録できない' do
        @user.firstname_kanji = 'a凛'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname kanji is invalid')
      end
      it 'firstname_kanjiに記号が入っていた場合新規登録できない' do
        @user.firstname_kanji = '！凛'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname kanji is invalid')
      end
      it 'familyname_katakanaが空の場合新規登録できない' do
        @user.familyname_katakana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Familyname katakana can't be blank")
      end
      it 'familyname_katakanaに数字が入っていた場合新規登録できない' do
        @user.familyname_katakana = '０タナカ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Familyname katakana is invalid')
      end
      it 'familyname_katakanaに英語が入っていた場合新規登録できない' do
        @user.familyname_katakana = 'aタナカ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Familyname katakana is invalid')
      end
      it 'familyname_katakanaに記号が入っていた場合新規登録できない' do
        @user.familyname_katakana = '！タナカ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Familyname katakana is invalid')
      end
      it 'familyname_katakanaに漢字が入っていた場合新規登録できない' do
        @user.familyname_katakana = '漬物タナカ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Familyname katakana is invalid')
      end
      it 'familyname_katakanaに平仮名が入っていた場合新規登録できない' do
        @user.familyname_katakana = 'つけものタナカ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Familyname katakana is invalid')
      end
      it 'firstname_katakanaが空の場合新規登録できない' do
        @user.firstname_katakana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname katakana can't be blank")
      end
      it 'firstname_katakanaに数字が入っていた場合新規登録できない' do
        @user.firstname_katakana = '０リン'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname katakana is invalid')
      end
      it 'firstname_katakanaに英語が入っていた場合新規登録できない' do
        @user.firstname_katakana = 'aリン'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname katakana is invalid')
      end
      it 'firstname_katakanaに記号が入っていた場合新規登録できない' do
        @user.firstname_katakana = '！リン'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname katakana is invalid')
      end
      it 'firstname_katakanaに漢字が入っていた場合新規登録できない' do
        @user.firstname_katakana = '漬物リン'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname katakana is invalid')
      end
      it 'firstname_katakanaに平仮名が入っていた場合新規登録できない' do
        @user.firstname_katakana = 'つけものリン'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname katakana is invalid')
      end
      it 'birthdayが空の場合新規登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
