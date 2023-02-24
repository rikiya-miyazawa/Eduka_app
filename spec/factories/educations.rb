FactoryBot.define do
  factory :education do
    name { '技術' }
    user_id { FactoryBot.create(:user) }
    division_id { FactoryBot.create(:division) }
  end
end