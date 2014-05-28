require 'spec_helper'

describe RejectedLeaveRequestNotificationJob do
  describe '.perform' do
    let(:mailer) { double }

    it 'invokes LeaveNotificationMailer.rejected_leave_request' do
      LeaveNotificationMailer.stub(:rejected_leave_request).and_return(mailer)

      expect(LeaveNotificationMailer).to receive(:rejected_leave_request).with(1)
      expect(mailer).to receive(:deliver)

      described_class.perform(1)
    end
  end
end
