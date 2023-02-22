require 'rails_helper'

RSpec.describe Position, type: :model do
  let!(:user) { FactoryBot.create(:user) }
  let!(:role) { FactoryBot.create(:role) }
  let!(:position) { FactoryBot.create(:position, user: user, role: role) }
  describe 'Positionのバリデーションのテスト' do
    context 'user_id, role_idがある場合' do
      it "ユーザに権限を付与できる" do
        expect(position).to be_valid
      end
    end
    context 'user_id, role_idが重複している場合' do
      it "ユーザに権限を付与できない" do
        position = Position.new(
          user_id: 1,
          role_id: 1
        )
        expect(position).not_to be_valid
      end
    end
  end
end