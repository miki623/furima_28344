require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録に成功するとき" do

      it "nickname、email、passwordとpassword_confirmation、氏名とカナ氏名、生年月日が揃っていると登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上半角英数字混合であれば登録できる" do
        @user.password = "aaa111"
        @user.password_confirmation = "aaa111"
        expect(@user).to be_valid
      end
    end

    context "新規登録に失敗するとき" do
      
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "emailに「@」がない場合は登録できない" do
        @user.email = "aaabbb.co.jp"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it "名字が空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名字を入力してください", "名字は全角で入力してください")
      end
      it "名前が空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください", "名前は全角で入力してください")
      end
      it "カナ名字が空では登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名字(カタカナ)を入力してください", "名字(カタカナ)は全角カタカナで入力してください")
      end
      it "カナ名前が空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(カタカナ)を入力してください", "名前(カタカナ)は全角カタカナで入力してください")
      end
      it "passwordが存在してもpassword_confirmationがない場合は登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "passwordが数字のみでは登録できない" do
        @user.password = "121212"
        @user.password_confirmation = "121212"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは文字と数字の両方を含めてください")
      end
      it "passwordが英字のみでは登録できない" do
        @user.password = "ababab"
        @user.password_confirmation = "ababab"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは文字と数字の両方を含めてください")
      end
      it "生年月日が空では登録できない" do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end

  

end