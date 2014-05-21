class LeavesController < ApplicationController
  before_action :set_employee, except: [:index, :update]

  def create
    coerce_leave_date!
    @leave = @employee.leaves.build(leave_params)
    copy_employee_denormalized_attributes!
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

  def index
    @leaves = Leave.all
  end

  def update
    @leave = Leave.find(params[:id])
    if @leave.update(status: enum_for(params[:status]))
      if params[:status].eql?('approve')
        Event.create(title: @leave.employee.decorate.full_name, start: @leave.leave_date)
      end
      redirect_to leaves_path
    else
      flash[:alert] = "Something went wrong."
      redirect_to leaves_path
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

    def copy_employee_denormalized_attributes!
      @leave.employee_first_name = @employee.first_name
      @leave.employee_last_name = @employee.last_name
      @leave.employee_email = @employee.email
    end

    def enum_for(status)
      case status
      when "approve" then 1
      when "reject" then 2
      end
    end
end
