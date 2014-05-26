require 'spec_helper'

describe LeaveReviewer do
  describe '#name' do
    it 'should return the first and last name' do
      @leave_reviewer = LeaveReviewer.new('Annie', 'Batumbakal', 'annie@batumbakal.com')

      expect(@leave_reviewer.name).to eql('Annie Batumbakal')
    end
  end
end
