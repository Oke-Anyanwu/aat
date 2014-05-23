require 'spec_helper'

describe Leave do
  before do
    @employee = FactoryGirl.create(:employee, first_name: 'Annie', middle_name: 'Danger', last_name: 'Batumbakal')
  end

  describe '#requester' do
    it 'should initialize a new LeaveRequester object' do
      @leave = FactoryGirl.create(:leave, employee_first_name: 'Annie', employee_last_name: 'Batumbakal', employee_email: 'annie@batumbakal.com')

      expect(LeaveRequester).to receive(:new).with('Annie', 'Batumbakal', 'annie@batumbakal.com')
      @leave.requester
    end
  end

  describe '#reviewer' do
    context 'when hr_first_name is present' do
      it 'should initialize a new LeaveReviewer object' do
        @leave = FactoryGirl.create(:leave, hr_first_name: 'Annie', hr_last_name: 'Batumbakal', hr_email: 'annie@batumbakal.com')

        expect(LeaveReviewer).to receive(:new).with('Annie', 'Batumbakal', 'annie@batumbakal.com')
        @leave.reviewer
      end
    end

    context 'when hr_first_name is blank' do
      it 'should not initialize a new LeaveReviewer object' do
        @leave = FactoryGirl.create(:leave, hr_last_name: 'Batumbakal', hr_email: 'annie@batumbakal.com')

        expect(LeaveReviewer).not_to receive(:new)
        @leave.reviewer
      end
    end
  end

  describe '#handle_status_update!' do
    context 'when status is approved' do
      it 'should create a new event' do
        @leave = FactoryGirl.create(:leave, employee_id: @employee.id, status: :approved)

        expect(Event).to receive(:create).with(title: 'Annie Danger Batumbakal', start: @leave.leave_date)
        @leave.handle_status_update!
      end
    end

    context 'when status is taken' do
      it 'should invoke Leave#take!' do
        @leave = FactoryGirl.create(:leave, employee_id: @employee.id, status: :taken)

        expect(@leave).to receive(:take!)
        @leave.handle_status_update!
      end
    end
  end

  describe '#take!' do
    context 'when leave is not taken' do
      it 'should raise an error' do
        @leave = FactoryGirl.create(:leave)
        expect{@leave.take!}.to raise_error(Exceptions::LeaveNotTakenError)
      end
    end

    context 'when leave is taken' do
      before do
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
