class AddApprovalStatus < ActiveRecord::Migration[5.1]
  def change
    add_column :request_approvals, :approved_status, :string, default: 'NOT APPROVED'
    add_column :request_approvals, :approved_at, :datetime
  end
end
