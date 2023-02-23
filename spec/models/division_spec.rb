require 'rails_helper'

RSpec.describe Division, type: :model do
  let!(:division) { FactoryBot.create(:division) }
  describe 'Divisionのバリデーションのテスト' do
    context '部署/店舗の名前の入力がある場合' do
      it "部署/店舗の登録ができる" do
        expect(division).to be_valid
      end
    end
    context '部署/店舗の名前の入力がない場合' do
      it "部署/店舗の登録ができない" do
        division = Division.new(name: '')
        expect(division).not_to be_valid
      end
    end
    context '部署/店舗の名前の入力が200文字以上ある場合' do
      it "部署/店舗の登録ができない" do
        division = Division.new(name: 'a' * 201)
        expect(division).not_to be_valid
      end
    end
  end
end