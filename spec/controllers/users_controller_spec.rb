require 'spec_helper'
require 'pry'
RSpec.describe UsersController, type: :controller do

  before(:all) do
    @user = FactoryGirl.create(:user_login_valid)
    @user.confirm
  end

  it 'redirect to user signin' do
    get :index
    expect(response).to redirect_to('/users/sign_in')
    expect(response.status).to eq(302)
  end

  it 'redirect to Show Page' do
    sign_in @user
    get :show, params: { id: @user.id }
    expect(response).to render_template('show')
  end

  it 'redirect to index Page' do
    sign_in @user
    get :index
    expect(response).to render_template('index')
  end

  it 'redirect to Show Page' do
    sign_in @user
    get :show, params: { id: @user.id }
    expect(response).to render_template('show')
  end


end
