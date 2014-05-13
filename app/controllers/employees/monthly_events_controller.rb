class Employees::MonthlyEventsController < EmployeesController
  def index
    render json: Event.all
  end
end
