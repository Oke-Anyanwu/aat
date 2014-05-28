class GrantLeaveCreditsNotificationJob
  @queue = :high

  def self.perform(employee_id, quantity)
    LeaveNotificationMailer.grant_leave_credits(employee_id, quantity).deliver
  end
end
