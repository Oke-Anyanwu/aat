class EmployeesController < ApplicationController
  before_action :authenticate_employee!
  before_action :set_employee, only: [:show, :update]

  def index
    @employees = Employee.all.order(:last_name)
  end

  def show
  end

  def update
    if @employee.update_attributes(employee_params)
      flash[:notice] = "Profile updated."
      redirect_to employee_path(@employee)
    else
      flash[:alert] = "Profile not updated."
      render :show
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
