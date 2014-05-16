class AddEmployeeDenormalizedAttributesToLeaves < ActiveRecord::Migration
  def change
    add_column :leaves, :employee_first_name, :string
    add_column :leaves, :employee_last_name, :string
    add_column :leaves, :employee_email, :string
    add_column :leaves, :hr_first_name, :string
    add_column :leaves, :hr_last_name, :string
    add_column :leaves, :hr_email, :string
  end
end
