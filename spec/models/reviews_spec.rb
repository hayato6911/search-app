require 'rails_helper'

RSpec.describe Review, type: :model do
  before do
    @review = FactoryBot.build(:review)
  end
  describe 'reviewモデルのバリデーション' do
    context '保存できる場合' do
      it "user_idとlocationがあれば保存できる" do
        expect(FactoryBot.create(:location)).to be_valid
      end
    end
    context '保存できない場合' do
      it "scoreが空欄" do
        expect(FactoryBot.build(:review, :score)).to_not be_valid
      end
      it "contentが空欄" do
        expect(FactoryBot.build(:review, :content)).to_not be_valid
      end
      it "user_idが無い" do
        expect(FactoryBot.build(:review, :user_id)).to_not be_valid
      end
      it "location_idが無い" do
        expect(FactoryBot.build(:review, :location_id)).to_not be_valid
      end
    end
  end
end
