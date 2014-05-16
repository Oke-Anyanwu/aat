class AddHrRoleBitToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :hr, :boolean, default: false
  end
end
