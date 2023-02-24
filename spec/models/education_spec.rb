require 'rails_helper'

RSpec.describe Education, type: :model do
  let!(:user) { FactoryBot.create(:user) }
  let!(:division) { FactoryBot.create(:division) }
  let!(:education) { FactoryBot.create(:education, user: user, division: division) }
  describe 'Educationのバリデーションのテスト' do
    context '教育ページの名前の入力がある場合' do
      it "教育ページの登録ができる" do
        expect(education).to be_valid
      end
    end
    context '教育ページの名前の入力がない場合' do
      it "教育ページの登録ができない" do
        education = Education.new(
          name: '',
          user: user,
          division: division
        )
        expect(education).not_to be_valid
      end
    end
    context '教育ページの名前の入力が100文字以上ある場合' do
      it "教育ページの登録ができない" do
        education = Education.new(
          name: 'a' * 101,
          user: user,
          division: division
        )
        expect(education).not_to be_valid
      end
    end
  end
end