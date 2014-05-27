class LeaveAccountsController < ApplicationController
  def update
    @leave_account = LeaveAccount.find(params[:id])
    authorize @leave_account
    @leave_account.credit(params[:credits].to_f)

    respond_to do |format|
      format.js
    end
  end
end
