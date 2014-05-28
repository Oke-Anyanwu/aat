class TakenLeaveRequestNotificationJob
  @queue = :high

  def self.perform(leave_id)
    LeaveNotificationMailer.taken_leave_request(leave_id).deliver
  end
end
