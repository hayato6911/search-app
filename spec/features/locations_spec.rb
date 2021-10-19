require 'rails_helper'

RSpec.feature "Locations", type: :feature do
  describe 'スポット検索のテスト' do
    it '検索後に想定しているデータの内容が表示されていること' do
      @params = {}
      @params[:q] = { name_cont: '東京' }
      @q = Location.ransack(@params)
      @locations = @q.result
      expect(@locations) == ({ name: '東京' })
    end

    it '検索後に想定しているデータの内容が表示されていないこと' do
      @params = {}
      @params[:q] = { name_cont: '東京' }
      @q = Location.ransack(@params)
      @locations = @q.result
      expect(@locations) != ({ name: '埼玉' })
    end
  end
end
