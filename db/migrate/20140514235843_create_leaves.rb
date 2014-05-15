class CreateLeaves < ActiveRecord::Migration
  def change
    create_table :leaves do |t|
      t.date :leave_date
      t.string :reason
      t.integer :employee_id

      t.timestamps
    end
  end
end
