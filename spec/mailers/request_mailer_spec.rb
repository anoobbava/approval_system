require 'spec_helper'

RSpec.describe RequestMailer, type: :mailer do

  before(:all) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
    @user = FactoryGirl.create(:user_login_valid)
    @request = FactoryGirl.create(:request_approval_valid, requested_by: @user.id)
  end

  after(:all) do
    ActionMailer::Base.deliveries.clear
  end

  it 'checks request received or not' do
    RequestMailer.request_received(@user, @request).deliver
    expect(ActionMailer::Base.deliveries.count).to eq(1)
    expect(ActionMailer::Base.deliveries.first.subject).to eq('Your Request received')
  end
end
