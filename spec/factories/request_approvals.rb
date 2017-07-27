FactoryGirl.define do
  factory :request_approval_valid, class: RequestApproval do
    name { Faker::Book.title }
    description { Faker::Lorem.sentence(3) }
    requested_by 2
    approved_by 3
  end

  factory :request_approval_invalid, class: RequestApproval do
    name nil
    description nil
    requested_by 2
    approved_by 3
  end
end
