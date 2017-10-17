class AddAvatarToRequestApprovals < ActiveRecord::Migration[5.1]
  def change
    add_column :request_approvals, :avatar, :string
  end
end
