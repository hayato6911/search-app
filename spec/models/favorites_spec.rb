require 'rails_helper'

RSpec.describe Favorite, type: :model do
  before do
    user = FactoryBot.create(:user)
    location = FactoryBot.create(:location)
    favorite = FactoryBot.build(:favorite)
  end
  describe 'いいね機能' do
    context 'いいねできる場合' do
        it "user_idとfood_idがあれば保存できる" do
          expect(favorite).to be_valid
        end
    end
  end
end
