require 'spec_helper'

RSpec.describe RequestApproval, type: :model do
  before(:all) do
    @valid_request = FactoryGirl.create(:request_approval_valid)
    @invalid_request = FactoryGirl.build(:request_approval_invalid)
  end

  it 'valid request approved' do
    expect(@valid_request).to be_valid
  end

  it 'invalid request rejected' do
    expect(@invalid_request).to be_invalid
  end

  it 'check the requester' do
    expect(@valid_request.requester_id).to eq(2)
  end

  it 'check the approver' do
    expect(@valid_request.approver_id).to eq(3)
  end

  it 'requester id is nil ' do
    expect(@invalid_request.name).to eq(nil)
  end
end
