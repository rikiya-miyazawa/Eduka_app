FactoryBot.define do
  factory :user do
    email { 'userspec@example.com' }
    password { '111111' }
  end
  factory :second_user, class: User do
    email { 'socond_userspec@example.com' }
    password { '111111' }
  end
end