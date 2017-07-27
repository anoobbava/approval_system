require 'spec_helper'
require 'pry'

RSpec.describe RequestApprovalsController, type: :controller do

  before(:all) do
    @user = FactoryGirl.create(:user_login_valid)
    @user.confirm
    # @valid_request = FactoryGirl.create(:request_approval_valid)
    # @invalid_request = FactoryGirl.build(:request_approval_invalid)
    @valid_request = FactoryGirl.attributes_for(:request_approval_valid)
    @invalid_request = FactoryGirl.attributes_for(:request_approval_invalid)

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


  # it 'post a request #create sucess' do
  #   sign_in @user
  #   # binding.pry
  #   # create_params_success = FactoryGirl.attributes_for(:request_approval_valid)
  #   request = FactoryGirl.create(:request_approval_valid)
  #   expect(request.requested_by).to eq(2)
  #   # post :
  #   # expect { post :create, create_params_success }.to change(RequestApproval, :count).by(1)
  #   # expect { post :create, request_approval: create_params_success }.to change(RequestApproval,
  #   #                                                                            :count).by(1)
  # end

  # it 'post a request #create failure' do
  #   create_param_fail = FactoryGirl.attributes_for(:request_approval_invalid)
  #   post :create, request_approval: create_param_fail
  #   expect(response).to render_template('new')
  # end

  # it 'updates the author' do
  #   binding.pry
  #   put :update, id: @author.id, author: @update_params
  #   expect(response).to redirect_to('/authors')
  # end

  # it 'renders the edit page' do
  #   get :edit, id: @author.id
  #   expect(response).to render_template('edit')
  # end

  # it 'render the show' do
  #   get :show, id: @author.id
  #   expect(response).to render_template('show')
  # end

  # it 'destroys author' do
  # expect{ delete :destroy, id: @author.id }.to change(Author, :count).by(-1)
  # end

  it 'redirect index' do
    sign_in @user
    get :index
    expect(response).to render_template('index')
  end
end
