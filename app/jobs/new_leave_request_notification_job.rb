class NewLeaveRequestNotificationJob
  @queue = :high

  def self.perform(leave_id)
    LeaveNotificationMailer.new_leave_request(leave_id).deliver
  end
end
