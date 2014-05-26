class RejectedLeaveRequestNotificationJob
  @queue = :high

  def self.perform(leave_id)
    LeaveNotificationMailer.rejected_leave_request(leave_id).deliver
  end
end
