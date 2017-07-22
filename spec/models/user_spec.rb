require 'spec_helper'
require 'pry'

RSpec.describe User, :type => :model do

  before(:all) do
    @valid_user = FactoryGirl.create(:user_login_valid)
    @valid_user.confirm
  end

  it 'has valid factory' do
    expect(@valid_user).to be_valid
  end

  it 'has invalid factory' do
    invalid_user = FactoryGirl.build(:user_login_invalid)
    expect(invalid_user).to be_invalid
  end
end
