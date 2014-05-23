require 'spec_helper'

describe LeaveAccount do
  describe '#deduct' do
    it 'should reduce the number of leave credits' do
      @employee = FactoryGirl.create(:employee)
      @leave_account = @employee.leave_account
      expect{@leave_account.deduct(1)}.to change{@leave_account.credits}.by(-1)
    end
  end
end
