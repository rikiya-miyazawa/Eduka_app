FactoryBot.define do
  factory :relationship do
    superior_id { FactoryBot.create(:user) }
    subordinate_id { FactoryBot.create(:user) }
  end
end