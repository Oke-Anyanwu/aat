require 'spec_helper'

describe ApprovedLeaveRequestNotificationJob do
  describe '.perform' do
    let(:mailer) { double }

    it 'invokes LeaveNotificationMailer.approved_leave_request' do
      LeaveNotificationMailer.stub(:approved_leave_request).and_return(mailer)

      expect(LeaveNotificationMailer).to receive(:approved_leave_request).with(1)
      expect(mailer).to receive(:deliver)

      described_class.perform(1)
    end
  end
end
