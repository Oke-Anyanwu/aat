class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :update]

  def index
    @employees = Employee.all.order(:last_name)
  end

  def show
    @leave = Leave.new
  end

  def update
    if @employee.update(employee_params)
      flash[:notice] = "Profile updated."
      redirect_to employee_path(@employee)
    else
      flash[:alert] = "Profile not updated."
      render action: :show
    end
  end

  private

    def employee_params
      params.require(:employee).permit(:first_name,
                                       :middle_name,
                                       :last_name)
    end

    def set_employee
      @employee = Employee.find(params[:id])
    end
end
