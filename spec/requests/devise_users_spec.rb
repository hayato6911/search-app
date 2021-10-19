require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    it "name、email、passwordとpassword_confirmationがあれば登録できること" do
      user = User.new(
        username: "テストユーザー",
        email: "test@yahoo.co.jp",
        password: "111111",
      )
      expect(user).to be_valid
    end
    it "名前が無い場合、無効である" do
      user = FactoryBot.build(:user, username: nil)
      user.valid?
      expect(user.errors[:username]).to include("can't be blank")
    end
    it "パスワードが無い場合、無効である" do
      user = FactoryBot.build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
    it "メールアドレスがない場合、無効である"  do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    it "重複したメールアドレスは、無効である" do
      user1 = FactoryBot.create(:user)
      user2 = FactoryBot.build(:user)
      user2.valid?
      expect(user2.errors[:email]).to include("has already been taken")
    end
  end
end
