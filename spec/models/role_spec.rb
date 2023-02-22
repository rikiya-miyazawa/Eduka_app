require 'rails_helper'

RSpec.describe Role, type: :model do
  let!(:role) { FactoryBot.create(:role) }
  describe 'Roleのバリデーションのテスト' do
    context '権限の種類の名前が入力されている場合' do
      it "ロール登録ができる" do
        expect(role).to be_valid
      end
    end
    context '権限の種類の名前が入力されていない場合' do
      it "ロール登録ができない" do
        role = Role.new(name: '')
        expect(role).not_to be_valid
      end
    end
    context '権限の種類の名前が100文字以上入力されている場合' do
      it "ロール登録ができない" do
        role = Role.new(name: 'a' * 101)
        expect(role).not_to be_valid
      end
    end
  end
end