class LeavesController < ApplicationController
  before_action :set_employee

  def create
    coerce_leave_date!
    @leave = @employee.leaves.build(leave_params)
    respond_to do |format|
      if @leave.save
        format.html { redirect_to employee_leaves_path(@employee),
                      notice: 'Your request was sent.' }
        format.js { @current_leave = @leave }
        format.json { render json: @leave, status: :created,
                      location: @user }
      else
        format.html { redirect_to employee_leaves_path(@employee),
                      alert: 'Something went wrong.' }
        format.js {}
        format.json { render json: @leave.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_employee
      @employee = Employee.find(params[:employee_id])
    end

    def leave_params
      params.require(:leave).permit(:leave_date, :reason)
    end

    def coerce_leave_date!
      params[:leave][:leave_date] = Date.strptime(params[:leave][:leave_date], "%m/%d/%Y")
    end
end
