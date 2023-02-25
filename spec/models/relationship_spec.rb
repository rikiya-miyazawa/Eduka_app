require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let!(:superior_user) { FactoryBot.create(:user) }
  let!(:subordinate_user1) { FactoryBot.create(:second_user) }
  let!(:subordinate_user2) { FactoryBot.create(:third_user) }
  let!(:relationship1) { FactoryBot.create(:relationship, superior: superior_user, subordinate: subordinate_user1) }
  let!(:relationship2) { FactoryBot.create(:relationship, superior: superior_user, subordinate: subordinate_user2) }
  describe 'Relationshipのバリデーションのテスト' do
    context 'superior_id, subordinate_idがある場合' do
      it "上司,部下の関係を登録できる" do
        expect(relationship1).to be_valid
        expect(relationship2).to be_valid
      end
    end
    context 'superior_id, subordinate_idが重複している場合' do
      it "ユーザに権限を付与できない" do
        relationship = Relationship.new(
          superior: superior_user,
          subordinate: subordinate_user1
        )
        expect(relationship).not_to be_valid
      end
    end
  end
end