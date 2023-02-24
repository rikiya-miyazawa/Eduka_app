FactoryBot.define do
  factory :subject do
    name { 'シャンプー' }
    status { false }
    deadline { '2023-2-23' }
    user_id { FactoryBot.create(:user) }
    education_id { FactoryBot.create(:education) }
  end
end