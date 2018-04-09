FactoryGirl.define do
  factory :request_approval_valid, class: RequestApproval do
    name { Faker::Book.title }
    description { Faker::Lorem.sentence(3) }
    requester { FactoryGirl.create(:user_login_valid) }
    approver { FactoryGirl.create(:user_login_valid1) }
  end

  factory :request_approval_valid1, class: RequestApproval do
    name { Faker::Book.title }
    description { Faker::Lorem.sentence(3) }
    requester { FactoryGirl.create(:user_login_valid1) }
    approver { FactoryGirl.create(:user_login_valid2) }
  end

  factory :request_approval_invalid, class: RequestApproval do
    name nil
    description nil
    requester_id 2
    approver_id 3
  end
end
