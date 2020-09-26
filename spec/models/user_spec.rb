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
        expect(@user).to_not be_valid
      end
      it 'emaliが空の場合新規登録できない' do
        @user.email = nil
        expect(@user).to_not be_valid
      end
      it 'emailが既に登録されているemailと重複していた場合新規登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        expect(another_user).to_not be_valid
      end
      it 'emailで@が使用されてない場合新規登録できない' do
        @user.email = 'aaaa1111yahoo.co.jp'
        expect(@user).to_not be_valid
      end
      it 'passwordが空の場合新規登録できない' do
        @user.password = nil
        expect(@user).to_not be_valid
      end
      it 'passwordが全角の場合新規登録できない' do
        @user.password = 'ABC123'
        @user.password_confirmation = 'ABC123'
        expect(@user).to_not be_valid
      end
      it 'passwordが半角アルファベットのみの場合新規登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        expect(@user).to_not be_valid
      end
      it 'passwordが半角数値のみの場合新規登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        expect(@user).to_not be_valid
      end
      it 'passwordが6文字を満たしてない場合新規登録できない' do
        @user.password = 'abc12'
        @user.password_confirmation = 'abc12'
        expect(@user).to_not be_valid
      end
      it 'passwordが存在してもpasswold_confirmationが空の場合新規登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = ''
        expect(@user).to_not be_valid
      end
      it 'familyname_kanjiが空の場合新規登録できない' do
        @user.familyname_kanji = nil
        expect(@user).to_not be_valid
      end
      it 'familyname_kanjiに数字が入っていた場合新規登録できない' do
        @user.familyname_kanji = '０田中'
        expect(@user).to_not be_valid
      end
      it 'familyname_kanjiに英語が入っていた場合新規登録できない' do
        @user.familyname_kanji = 'a田中'
        expect(@user).to_not be_valid
      end
      it 'familyname_kanjiに記号が入っていた場合新規登録できない' do
        @user.familyname_kanji = '！田中'
        expect(@user).to_not be_valid
      end
      it 'firstname_kanjiが空の場合新規登録できない' do
        @user.firstname_kanji = nil
        expect(@user).to_not be_valid
      end
      it 'firstname_kanjiに数字が入っていた場合新規登録できない' do
        @user.firstname_kanji = '０凛'
        expect(@user).to_not be_valid
      end
      it 'firstname_kanjiに英語が入っていた場合新規登録できない' do
        @user.firstname_kanji = 'a凛'
        expect(@user).to_not be_valid
      end
      it 'firstname_kanjiに記号が入っていた場合新規登録できない' do
        @user.firstname_kanji = '！凛'
        expect(@user).to_not be_valid
      end
      it 'familyname_katakanaが空の場合新規登録できない' do
        @user.familyname_katakana = nil
        expect(@user).to_not be_valid
      end
      it 'familyname_katakanaに数字が入っていた場合新規登録できない' do
        @user.familyname_katakana = '０タナカ'
        expect(@user).to_not be_valid
      end
      it 'familyname_katakanaに英語が入っていた場合新規登録できない' do
        @user.familyname_katakana = 'aタナカ'
        expect(@user).to_not be_valid
      end
      it 'familyname_katakanaに記号が入っていた場合新規登録できない' do
        @user.familyname_katakana = '！タナカ'
        expect(@user).to_not be_valid
      end
      it 'familyname_katakanaに漢字が入っていた場合新規登録できない' do
        @user.familyname_katakana = '漬物タナカ'
        expect(@user).to_not be_valid
      end
      it 'familyname_katakanaに平仮名が入っていた場合新規登録できない' do
        @user.familyname_katakana = 'つけものタナカ'
        expect(@user).to_not be_valid
      end
      it 'firstname_katakanaが空の場合新規登録できない' do
        @user.firstname_katakana = nil
        expect(@user).to_not be_valid
      end
      it 'firstname_katakanaに数字が入っていた場合新規登録できない' do
        @user.firstname_katakana = '０リン'
        expect(@user).to_not be_valid
      end
      it 'firstname_katakanaに英語が入っていた場合新規登録できない' do
        @user.firstname_katakana = 'aリン'
        expect(@user).to_not be_valid
      end
      it 'firstname_katakanaに記号が入っていた場合新規登録できない' do
        @user.firstname_katakana = '！リン'
        expect(@user).to_not be_valid
      end
      it 'firstname_katakanaに漢字が入っていた場合新規登録できない' do
        @user.firstname_katakana = '漬物リン'
        expect(@user).to_not be_valid
      end
      it 'firstname_katakanaに平仮名が入っていた場合新規登録できない' do
        @user.firstname_katakana = 'つけものリン'
        expect(@user).to_not be_valid
      end
      it 'birthdayが空の場合新規登録できない' do
        @user.birthday = nil
        expect(@user).to_not be_valid
      end
    end
  end
end
