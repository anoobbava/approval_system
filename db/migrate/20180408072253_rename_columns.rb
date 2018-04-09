class RenameColumns < ActiveRecord::Migration[5.1]
  def change
    rename_column :request_approvals, :requested_by, :requester_id
    rename_column :request_approvals, :approved_by, :approver_id
  end
end
