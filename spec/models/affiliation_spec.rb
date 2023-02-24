require 'rails_helper'

RSpec.describe Affiliation, type: :model do
  let!(:user) { FactoryBot.create(:user) }
  let!(:division) { FactoryBot.create(:division) }
  let!(:affiliation) { FactoryBot.create(:affiliation, user: user, division: division) }
  describe 'Affiliationのmodel specテスト' do
    context 'user_id, division_idがある場合' do
      it "ユーザの所属を登録できる" do
        expect(affiliation).to be_valid
      end
    end
  end
end