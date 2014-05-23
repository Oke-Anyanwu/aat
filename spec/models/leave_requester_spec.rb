require 'spec_helper'

describe LeaveRequester do
  describe '#name' do
    it 'should return the first and last name' do
      @leave_requester = LeaveRequester.new('Annie', 'Batumbakal', 'annie@batumbakal.com')

      expect(@leave_requester.name).to eql('Annie Batumbakal')
    end
  end
end
