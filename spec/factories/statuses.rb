FactoryBot.define do
  factory :status do
    purpose { 'お客様から信頼を得るために、技術力を高める目的のページです' }
    created_date { '2023-2-22' }
    education_period { '2024-3-22' }
    remarks { '全国フェアリーコンテスト入選を目指します。' }
    education_id { FactoryBot.create(:education) }
  end
end