class CreateLeaveAccounts < ActiveRecord::Migration
  def change
    create_table :leave_accounts do |t|
      t.float :credits, default: 0.0
      t.integer :employee_id

      t.timestamps
    end
  end
end
