require 'rails_helper'

RSpec.describe Status, type: :model do
  let!(:user) { FactoryBot.create(:user) }
  let!(:division) { FactoryBot.create(:division) }
  let!(:education) { FactoryBot.create(:education, user: user, division: division) }
  let!(:status) { FactoryBot.create(:status, education: education) }
  describe 'Statusのバリデーションのテスト' do
    context '教育目的の入力がある場合' do
      it "教育ページ性質の登録ができる" do
        expect(status).to be_valid
      end
    end
    context '教育目的の入力がない場合' do
      it "教育ページ性質の登録ができない" do
        status = Status.new(
          purpose: '',
          created_date: '2023-2-22',
          education_period: '2024-3-22',
          remarks: '全国フェアリーコンテスト入選を目指します。',
          education: education
        )
        expect(status).not_to be_valid
      end
    end
    context '備考の入力文字数が5000文字以上の場合' do
      it "教育ページ性質の登録ができない" do
        status = Status.new(
          purpose: 'お客様から信頼を得るために、技術力を高める目的のページです',
          created_date: '2023-2-22',
          education_period: '2024-3-22',
          remarks: 'a' * 5001,
          education: education
        )
        expect(status).not_to be_valid
      end
    end
    context '教育期間が教育開始日より前に設定された場合' do
      it "教育ページ性質の登録ができない" do
        status = Status.new(
          purpose: 'お客様から信頼を得るために、技術力を高める目的のページです',
          created_date: '2023-2-22',
          education_period: '2021-3-22',
          remarks: '全国フェアリーコンテスト入選を目指します。',
          education: education
        )
        expect(status).not_to be_valid
      end
    end
  end
end