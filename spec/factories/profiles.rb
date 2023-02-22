FactoryBot.define do
  factory :profile do
    name { 'specprofile' }
    hire_date { '2023-2-22' }
    job { 'スタイリスト' }
  end
  factory :noname_profile, class: Profile do
    name { '' }
    hire_date { '2023-2-22' }
    job { 'スタイリスト' }
  end
end