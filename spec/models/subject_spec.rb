require 'rails_helper'

RSpec.describe Subject, type: :model do
  let!(:user) { FactoryBot.create(:user) }
  let!(:division) { FactoryBot.create(:division) }
  let!(:education) { FactoryBot.create(:education, user: user, division: division) }
  let!(:subject) { FactoryBot.create(:subject, user: user, education: education) }

  describe 'Subjectのバリデーションのテスト' do
    context '課題の名前の入力がある場合' do
      it "課題の登録ができる" do
        expect(subject).to be_valid
      end
    end
    context '課題の名前の入力がない場合' do
      it "課題の登録ができない" do
        subject = Subject.new(
          name: '',
          status: false,
          deadline: '2023-2-23',
          user: user,
          education: education
        )
        expect(subject).not_to be_valid
      end
    end
    context '課題の名前が100文字以上入力された場合' do
      it "課題の登録ができない" do
        subject = Subject.new(
          name: 'a' * 101,
          status: false,
          deadline: '2023-2-23',
          user: user,
          education: education
        )
        expect(subject).not_to be_valid
      end
    end
  end
end