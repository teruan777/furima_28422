require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録'do
    befre do
      @user = FactoryBot.bulid(:user)
    end
    context '新規登録できるとき'do
      it "全ての項目が入っていてかつemailが@を含みデータベースのemailと重複していないかつパスワードは6文字以上の半角英数字混合でありかつkanjiの項目で苗字と名前が漢字か平仮名かカタカナが使われていてkatakanaの項目では苗字と名前がカタカナが使われていれば新規登録できる" do

      end
    end
    context '新規登録できないとき' do
      it "nikunameが空の場合新規登録できない" do

      end
      it "emaliが空の場合新規登録できない" do

      end
      it "emailが既に登録されているemailと重複していた場合新規登録できない" do

      end
      it "emailで@が使用されてない場合新規登録できない" do

      end
      it "passwordが空の場合新規登録できない" do

      end
      it "passwoldが6文字を満たしてない場合新規登録できない" do

      end
      it "passwoldが存在してもpasswold_confirmationが空の場合新規登録できない" do

      end
      it "fimilyname_kanjiが空の場合新規登録できない" do

      end
      it "fimilyname_kanjiが漢字、平仮名、カタカナ以外だった場合新規登録できない" do

      end
      it "firstname_kanjiが空の場合新規登録できない" do

      end
      it "firstname_kanjiが漢字、平仮名、カタカナ以外だった場合新規登録できない" do

      end
      it "fimilyname_katakanaが空の場合新規登録できない" do

      end
      it "fimilyname_katakanaがカタカナ以外だった場合新規登録できない" do

      end
      it "firstname_katakanaが空の場合新規登録できない" do

      end
      it "firstname_katakanaがカタカナ以外だった場合新規登録できない" do

      end
      it "birthdayが空の場合新規登録できない" do

      end
    end
  end
end
