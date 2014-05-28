require 'spec_helper'

describe GrantLeaveCreditsNotificationJob do
  describe '.perform' do
    let(:mailer) { double }

    it 'invokes LeaveNotificationMailer.grant_leave_credits' do
      LeaveNotificationMailer.stub(:grant_leave_credits).and_return(mailer)

      expect(LeaveNotificationMailer).to receive(:grant_leave_credits).with(1, 2)
      expect(mailer).to receive(:deliver)

      described_class.perform(1, 2)
    end
  end
end
