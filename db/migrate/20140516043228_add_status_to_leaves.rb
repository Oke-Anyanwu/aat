class AddStatusToLeaves < ActiveRecord::Migration
  def change
    add_column :leaves, :status, :integer, default: 0
  end
end
