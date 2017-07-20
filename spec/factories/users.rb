FactoryGirl.define do

  factory :user_login, class: User do
    email Faker::Internet.email
    password 'password'
    password_confirmation 'password'
  end
end
