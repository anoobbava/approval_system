class CreateRequestApprovals < ActiveRecord::Migration[5.1]
  def change
    create_table :request_approvals do |t|
      t.string :name
      t.string :description
      t.integer :requested_by
      t.integer :approved_by
      t.timestamps
    end
  end
end
