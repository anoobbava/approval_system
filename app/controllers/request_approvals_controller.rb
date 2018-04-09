# controller which deals request and approval
class RequestApprovalsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_request, only: [:edit, :update, :destroy, :show, :approve]

  def new
    @request_approval = RequestApproval.new
    @users = User.all
  end

  def create
    @request_approval = RequestApproval.new(request_params)
    @request_approval.requester = current_user
    if @request_approval.save
      flash[:success] = 'Request submitted successfully'
      RequestMailer.request_received(current_user,
                                     @request_approval).deliver_later
      redirect_to @request_approval
    else
      flash[:error] = 'error on request creation'
      render 'new'
    end
  end

  def show
  end

  def update
  end

  def index
    @requests_for_approvals = RequestApproval.to_be_approved(current_user)
  end

  def edit
  end

  def destroy
  end

  def approve
    @request_detail.mark_as_approved
    if @request_detail.save!
      flash[:success] = 'Request Approved successfully'
      redirect_to request_approvals_path
    else
      flash[:error] = 'Error on Approval'
      redirect_to @request_detail
    end
  end

  private

  def find_request
    @request_detail = RequestApproval.find(params[:id])
  end

  def request_params
    params.require(:request_approval).permit(:name, :description, :approver_id)
  end
end
