require 'spec_helper'

describe TakenLeaveRequestNotificationJob do
  describe '.perform' do
    let(:mailer) { double }

    it 'invokes LeaveNotificationMailer.taken_leave_request' do
      LeaveNotificationMailer.stub(:taken_leave_request).and_return(mailer)

      expect(LeaveNotificationMailer).to receive(:taken_leave_request).with(1)
      expect(mailer).to receive(:deliver)

      described_class.perform(1)
    end
  end
end
