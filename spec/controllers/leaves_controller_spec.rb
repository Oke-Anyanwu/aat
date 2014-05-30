require 'spec_helper'

describe LeavesController do
  let!(:employee) { FactoryGirl.create(:employee, first_name: 'Annie', middle_name: 'Danger', last_name: 'Batumbakal') }
  let!(:leave) { FactoryGirl.create(:leave, id: 1) }

  before do
    login_employee(employee)
    Employee.stub(:find).and_return(employee)
  end

  describe '#create' do
    before do
      employee.stub_chain(:leaves, :build).and_return(leave)
    end

    context 'when leave is valid' do
      it 'adds NewLeaveRequestNotificationJob to the queue' do
        expect(Resque).to receive(:enqueue).with(NewLeaveRequestNotificationJob, 1)

        post :create, leave: {leave_date: '05/26/2014'}
      end
    end

    context 'when leave is not valid' do
      it 'rejects the save' do
        leave.stub(:save).and_return(false)

        post :create, employee_id: employee.id, leave: { leave_date: leave.leave_date.strftime('%m/%d/%Y'), reason: leave.reason }

        expect(flash[:alert]).to eql('Something went wrong.')
        expect(response).to redirect_to(employee_leaves_path(employee))
      end
    end
  end

  describe '#update' do
    context 'when leave is invalid' do
      it 'rejects the update' do
        Leave.stub(:find).and_return(leave)
        leave.stub(:update).and_return(false)

        patch :update, employee_id: employee.id, id: leave.id, status: :approved

        expect(flash[:alert]).to eql('Something went wrong.')
        expect(response).to redirect_to(leaves_path)
      end
    end
  end
end
