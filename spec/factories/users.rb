FactoryBot.define do
  factory :user do
    username               {"テストユーザー"}
    email                 {"test@yahoo.co.jp"}
    password              {"111111"}
    password_confirmation {"111111"}
  end
end
