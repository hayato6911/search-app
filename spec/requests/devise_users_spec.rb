require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー登録' do
     it "name、email、passwordとpassword_confirmationがあれば登録できること" do
       user = build(:user)
       expect(user).to be_valid
     end
  end
end