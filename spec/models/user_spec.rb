require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    it "全ての値が正しく入力されていれば保存できること" do
      expect(@user).to be_valid
    end
    it "nicknameが空では登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録ができないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "重複したemailが存在する場合登録ができない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      #binding.pry
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailに@が含まれていないと登録ができないこと" do
      @user.email = "a.gmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが空だと登録できないこと" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが５文字以下だと登録できないこと" do
      @user.password = "aaa11"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordが半角数字のみでは登録できないこと" do
      @user.password = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password に6文字以上の半角英数混合で入力して下さい")
    end
    it "passwordが半角英字のみでは登録できないこと" do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password に6文字以上の半角英数混合で入力して下さい")
    end
    it "passwordが存在してもpassword_confirmationが一致していないと登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "ユーザー本名は、名字が必須であること" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "ユーザー本名は、名前が必須であること" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "ユーザー本名は、名字が全角（漢字・ひらがな・カタカナ）なことが必須であること" do
      @user.last_name = "yamada"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name に全角文字で入力してください")
    end
    it "ユーザー本名は、名前が全角（漢字・ひらがな・カタカナ）なことが必須であること" do
      @user.first_name = "taro"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name に全角文字で入力してください")
    end
    it "ユーザー本名の名字のフリガナは、全角（カタカナ）での入力が必須であること" do
      @user.last_name_kana = "山田"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana に全角カタカナで入力してください")
    end
    it "ユーザー本名の名前のフリガナは、全角（カタカナ）での入力が必須であること" do
      @user.first_name_kana = "太郎"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana に全角カタカナで入力してください")
    end
    it "生年月日が必須であること" do
      @user.birth_date = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end
