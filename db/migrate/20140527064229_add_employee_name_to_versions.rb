class AddEmployeeNameToVersions < ActiveRecord::Migration
  def change
    add_column :versions, :employee_name, :string
  end
end
