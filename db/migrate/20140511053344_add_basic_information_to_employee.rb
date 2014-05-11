class AddBasicInformationToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :first_name, :string
    add_column :employees, :middle_name, :string
    add_column :employees, :last_name, :string
    add_column :employees, :contact_number, :string
  end
end
