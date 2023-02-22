require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { FactoryBot.create(:user) }
  describe 'Userのバリデーションのテスト' do
    context 'メールアドレスとパスワードがある場合' do
      it "ユーザー登録ができる" do
      expect(user).to be_valid
      end
    end
    context 'メールアドレスが空欄の場合' do
      it "バリデーションに引っ掛かり失敗する" do
        user = User.new(
          email: '',
          password: '111111'
        )
        expect(user).not_to be_valid
      end
    end
    context 'メールアドレスが255文字以上ある場合' do
      it "バリデーションに引っ掛かり失敗する" do
        user = User.new(
          email: 'a' * 256 + '@example.com',
          password: '111111'
        )
        expect(user).not_to be_valid
      end
    end
    context 'メールアドレスのフォーマットが指定した以外の形式の場合' do
      it "バリデーションに引っ掛かり失敗する" do
        user = User.new(
          email: 'userspecexample.com',
          password: '111111'
        )
        expect(user).not_to be_valid
      end
    end
    context '重複したメールアドレスで登録しようとした場合' do
      it "バリデーションに引っ掛かり失敗する" do
        user = User.new(
          email: 'userspec@example.com',
          password: '111111'
        )
        expect(user).not_to be_valid
      end
    end
  end
end