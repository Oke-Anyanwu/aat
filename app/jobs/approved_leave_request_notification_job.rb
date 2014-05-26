class ApprovedLeaveRequestNotificationJob
  @queue = :high

  def self.perform(leave_id)
    LeaveNotificationMailer.approved_leave_request(leave_id).deliver
  end
end
