class LeaveAccountsController < ApplicationController
  def update
    @leave_account = LeaveAccount.find(params[:id])
    authorize @leave_account
    quantity = params[:credits].to_f

    if @leave_account.credit(quantity)
      Resque.enqueue(GrantLeaveCreditsNotificationJob, @leave_account.employee_id, quantity)
    end

    respond_to do |format|
      format.js
    end
  end
end
