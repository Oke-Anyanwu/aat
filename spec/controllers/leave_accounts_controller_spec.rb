require 'spec_helper'

describe LeaveAccountsController do
  describe '#update' do
    let!(:employee) { FactoryGirl.create(:employee, id: 22, first_name: 'Annie', middle_name: 'Danger', last_name: 'Batumbakal') }
    let!(:hr) { FactoryGirl.create(:hr) }

    before do
      controller.stub(:current_employee).and_return(hr)
    end

    context 'when leave credits have successfully been granted' do
      it 'adds GrantLeaveCreditsNotificationJob to the queue' do
        expect(Resque).to receive(:enqueue).with(GrantLeaveCreditsNotificationJob, 22, 1)

        xhr :patch, :update, id: employee.leave_account.id, employee_id: employee.id, credits: 1
      end
    end

    context 'when leave credits are not granted' do
      it "doesn't add GrantLeaveCreditsNotificationJob to the queue" do
        LeaveAccount.stub(:find).and_return(employee.leave_account)
        employee.leave_account.stub(:credit).and_return(false)
        expect(Resque).not_to receive(:enqueue)

        xhr :patch, :update, id: employee.leave_account.id, employee_id: employee.id, credits: 1
      end
    end
  end
end
