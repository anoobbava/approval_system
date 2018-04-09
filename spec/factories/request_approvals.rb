FactoryGirl.define do
  factory :request_approval_valid, class: RequestApproval do
    name { Faker::Book.title }
    description { Faker::Lorem.sentence(3) }
    requester_id 2
    approver_id 3
  end

  factory :request_approval_valid1, class: RequestApproval do
    name { Faker::Book.title }
    description { Faker::Lorem.sentence(3) }
    requester_id 2
    approver_id 4
  end

  factory :request_approval_invalid, class: RequestApproval do
    name nil
    description nil
    requester_id 2
    approver_id 3
  end
end
