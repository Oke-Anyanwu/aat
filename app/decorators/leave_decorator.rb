class LeaveDecorator < ApplicationDecorator
  def leave_date
    object.leave_date.strftime('%B %-d, %Y')
  end

  def notification_message(version)
    if version.employee_name.nil?
      employee_name = object.employee.decorate.full_name
    else
      employee_name = version.employee_name
    end

    case version.event
    when 'create'
      "#{employee_name} filed a leave request"
    when 'update'
      "#{employee_name} changed the status from #{version.changeset['status'].first} to #{version.changeset['status'].last}"
    end
  end
end
