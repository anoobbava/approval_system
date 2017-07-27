require 'spec_helper'
require 'pry'

RSpec.describe RequestApprovalsController, type: :controller do

  before(:all) do
    @user = FactoryGirl.create(:user_login_valid)
    @user.confirm
    @valid_request = FactoryGirl.create(:request_approval_valid)
    @invalid_request = FactoryGirl.build(:request_approval_invalid)
  end

  it 'GET #new' do
    sign_in @user
    get :new
    expect(response.status).to eq(200)
    expect(response).to render_template('new')
  end

  it 'GET #redirect to sign_in' do
    get :new
    expect(response.status).to eq(302)
    expect(response).to redirect_to('/users/sign_in')
  end

  it 'redirect index' do
    sign_in @user
    get :index
    expect(response).to render_template('index')
  end

  it 'approves the request' do
    sign_in @user
    post 'approve', params: { id: @valid_request.id }
    expect(response).to redirect_to('/request_approvals')
  end

  it 'fails to approve' do
    sign_in @user
    @valid_request = FactoryGirl.create(:request_approval_valid)
    post 'approve', params: { id: @valid_request }
     flash[:error] = 'Error on Approval'
    expect(flash[:error]).to be_present
  end
end
