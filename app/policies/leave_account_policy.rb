class LeaveAccountPolicy < Struct.new(:employee, :leave_policy)
  def update?
    employee.hr?
  end
end
