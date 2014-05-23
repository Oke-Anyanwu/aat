require 'spec_helper'

describe Leave do
  describe '#take!' do
    context 'when leave is not taken' do
      it 'should raise an error' do
        @leave = FactoryGirl.create(:leave)
        expect{@leave.take!}.to raise_error(Exceptions::LeaveNotTakenError)
      end
    end

    context 'when leave is taken' do
      before do
        @employee = FactoryGirl.create(:employee)
        @leave = FactoryGirl.create(:leave, employee_id: @employee.id, status: :taken)
      end

      it 'should not raise an error' do
        expect{@leave.take!}.not_to raise_error
      end

      it 'should invoke LeaveAccount#deduct' do
        expect(@leave.employee.leave_account).to receive(:deduct).with(1)
        @leave.take!
      end
    end
  end
end
