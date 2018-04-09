FactoryGirl.define do

  factory :user_login_valid, class: User do
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
  end

  factory :user_login_valid1, class: User do
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
  end

  factory :user_login_valid2, class: User do
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
  end

  factory :user_login_invalid, class: User do
    email nil
    password 'password'
    password_confirmation 'password'
  end
end
