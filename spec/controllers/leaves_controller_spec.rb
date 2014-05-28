require 'spec_helper'

describe LeavesController do
  describe '#create' do
    let!(:employee) { FactoryGirl.create(:employee, first_name: 'Annie', middle_name: 'Danger', last_name: 'Batumbakal') }
    let!(:leave) { FactoryGirl.create(:leave, id: 1) }

    before do
      login_employee(employee)
      Employee.stub(:find).and_return(employee)
      employee.stub_chain(:leaves, :build).and_return(leave)
    end

    context 'when leave is valid' do
      it 'adds NewLeaveRequestNotificationJob to the queue' do
        expect(Resque).to receive(:enqueue).with(NewLeaveRequestNotificationJob, 1)

        post :create, leave: {leave_date: '05/26/2014'}
      end
    end
  end
end
