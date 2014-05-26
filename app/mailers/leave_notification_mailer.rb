class LeaveNotificationMailer < ActionMailer::Base
  def new_leave_request(leave_id)
    @leave = Leave.find(leave_id)
    mail(subject: 'New Leave Request', to: Employee.human_resources.map(&:email))
  end

  def approved_leave_request(leave_id)
    @leave = Leave.find(leave_id)
    mail(subject: 'Your leave request has been approved', to: @leave.employee.email)
  end

  def rejected_leave_request(leave_id)
    @leave = Leave.find(leave_id)
    mail(subject: 'Your leave request has been rejected', to: @leave.employee.email)
  end

  def taken_leave_request(leave_id)
    @leave = Leave.find(leave_id)
    mail(subject: 'Your approved leave request has been marked as taken', to: @leave.employee.email)
  end

  def grant_leave_credits(employee_id, quantity)
    @employee = Employee.find(employee_id)
    @quantity = quantity
    mail(subject: 'Leave credits have been granted to your account', to: @employee.email)
  end
end
