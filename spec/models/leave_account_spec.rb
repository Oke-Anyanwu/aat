require 'spec_helper'

describe LeaveAccount do
  before do
    @employee = FactoryGirl.create(:employee)
    @leave_account = @employee.leave_account
  end

  describe '#credit' do
    it 'should increase the number of leave credits' do
      expect{@leave_account.credit(1)}.to change{@leave_account.credits}.by(1)
    end
  end

  describe '#debit' do
    it 'should reduce the number of leave credits' do
      expect{@leave_account.debit(1)}.to change{@leave_account.credits}.by(-1)
    end
  end
end
