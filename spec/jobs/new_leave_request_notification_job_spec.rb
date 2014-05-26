require 'spec_helper'

describe NewLeaveRequestNotificationJob do
  describe '.perform' do
    let(:mailer) { double }

    it 'invokes LeaveNotificationMailer.new_leave_request' do
      LeaveNotificationMailer.stub(:new_leave_request).and_return(mailer)

      expect(LeaveNotificationMailer).to receive(:new_leave_request).with(1)
      expect(mailer).to receive(:deliver)

      described_class.perform(1)
    end
  end
end
