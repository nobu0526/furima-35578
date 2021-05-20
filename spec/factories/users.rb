FactoryBot.define do
  factory :user do
    nickname         {"test"}
    email           {"test@com"}
    first_name      {"テスト"}
    last_name       {"テスト"}
    first_name_kana {"テスト"}
    last_name_kana  {"テスト"}
    birthday        {"1930-01-01"}
    password        {"test000"} 
    password_confirmation {password}
  end
end