class LeaveDecorator < ApplicationDecorator
  def leave_date
    object.leave_date.strftime('%B %-d, %Y')
  end
end
