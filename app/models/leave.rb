require 'exceptions'

class Leave < ActiveRecord::Base
  belongs_to :employee

  has_paper_trail

  enum status: [:pending, :approved, :rejected, :taken]

  def requester
    LeaveRequester.new(self.employee_first_name, self.employee_last_name, self.employee_email)
  end

  def reviewer
    LeaveReviewer.new(self.hr_first_name, self.hr_last_name, self.hr_email) unless self.hr_first_name.nil?
  end

  def handle_status_update!
    case self.status
    when 'approved'
      Event.create(title: self.employee.decorate.full_name, start: self.leave_date)
      Resque.enqueue(ApprovedLeaveRequestNotificationJob, self.id)
    when 'rejected'
      Resque.enqueue(RejectedLeaveRequestNotificationJob, self.id)
    when 'taken'
      self.take!
      Resque.enqueue(TakenLeaveRequestNotificationJob, self.id)
    end
  end

  def take!
    raise Exceptions::LeaveNotTakenError unless self.taken?
    self.employee.leave_account.debit(1)
  end
end
