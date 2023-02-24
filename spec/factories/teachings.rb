FactoryBot.define do
  factory :teaching do
    date { '2023-2-23' }
    educator { '鈴木雅人' }
    title { 'シャンプーの手順について' }
    content { 'まずはクロスをつけてから...' }
    advice { '水が跳ねないように気をつけよう！' }
    remarks { '次回はマッサージも教えてあげてください。' }
    user_id { FactoryBot.create(:user) }
    subject_id { FactoryBot.create(:subject) }
  end
end