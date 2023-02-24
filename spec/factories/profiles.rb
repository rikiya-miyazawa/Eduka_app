FactoryBot.define do
  factory :profile do
    name { '田中舞' }
    hire_date { '2023-2-22' }
    job { 'スタイリスト' }
  end
  factory :noname_profile, class: Profile do
    name { '' }
    hire_date { '2023-2-22' }
    job { 'スタイリスト' }
  end
  factory :second_profile, class: Profile do
    name { '下田竜也' }
    hire_date { '2022-2-22' }
    job { 'アシスタント' }
  end
  factory :third_profile, class: Profile do
    name { '中村あい' }
    hire_date { '2021-2-22' }
    job { 'スタイリスト' }
  end
end