class LeaveAccountsController < ApplicationController
  def update
    @leave_account = LeaveAccount.find(params[:id])
    @leave_account.grant(params[:credits].to_f)

    respond_to do |format|
      format.js
    end
  end
end
