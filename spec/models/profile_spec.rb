require 'rails_helper'

RSpec.describe Profile, type: :model do
  let!(:user) { FactoryBot.create(:user) }
  let!(:profile) { FactoryBot.create(:profile, user: user) }
  describe 'Profileのバリデーションのテスト' do
    context '名前が入力されている場合' do
      it "プロフィール登録ができる" do
        expect(profile).to be_valid
      end
    end
    context '名前が入力されていない場合' do
      it "プロフィール登録ができない" do
        profile = FactoryBot.build(:profile, name: '', hire_date: '2023-2-22', job: 'スタイリスト', user: user)
        expect(profile).to_not be_valid
      end
    end
    context '名前が100文字以上入力されている場合' do
      it "プロフィール登録ができない" do
        profile = FactoryBot.build(:profile, name: 'a' * 101, hire_date: '2023-2-22', job: 'スタイリスト', user: user)
        expect(profile).to_not be_valid
      end
    end
    context '職種が100文字以上入力されている場合' do
      it "プロフィール登録ができない" do
        profile = FactoryBot.build(:profile, name: 'profile', hire_date: '2023-2-22', job: 'a' * 101, user: user)
        expect(profile).to_not be_valid
      end
    end
  end
end