class Leave < ActiveRecord::Base
  belongs_to :employee

  has_paper_trail

  def requester
    LeaveRequester.new(self.employee_first_name, self.employee_last_name, self.employee_email)
  end

  def reviewer
    LeaveReviewer.new(self.hr_first_name, self.hr_last_name, self.hr_email) unless self.hr_first_name.nil?
  end
end
