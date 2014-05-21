class EmployeeDecorator < ApplicationDecorator
  def full_name
    "#{object.first_name} #{object.middle_name} #{object.last_name}"
  end
end
