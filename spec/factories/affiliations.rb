FactoryBot.define do
  factory :affiliation do
    user_id { FactoryBot.create(:user) }
    division_id { FactoryBot.create(:division) }
  end
end