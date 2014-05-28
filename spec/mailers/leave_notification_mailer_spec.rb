require 'spec_helper'

describe LeaveNotificationMailer do
  let!(:hr) { FactoryGirl.create(:hr, email: 'hr@aelogica.com') }
  let!(:employee) { FactoryGirl.create(:employee, first_name: 'Annie', middle_name: 'Danger', last_name: 'Batumbakal', email: 'annie@batumbakal.com') }
  let!(:leave) do
    FactoryGirl.create(:leave,
                       id: 1,
                       employee_id: employee.id,
                       leave_date: Date.parse('May 26, 2014'),
                       reason: 'Nothing much')
  end

  describe '.new_leave_request' do
    let(:mail) { described_class.new_leave_request(leave.id) }

    it 'renders the subject' do
      expect(mail.subject).to eql('New Leave Request')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql(['hr@aelogica.com'])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['no-reply@aelogica.com'])
    end

    it 'renders the employee name' do
      expect(mail.body.encoded).to have_content('Annie Danger Batumbakal')
    end

    it 'renders the leave date' do
      expect(mail.body.encoded).to have_content('May 26, 2014')
    end

    it 'renders the reason' do
      expect(mail.body.encoded).to have_content('Nothing much')
    end
  end

  describe '.approved_leave_request' do
    let(:mail) { described_class.approved_leave_request(leave.id) }

    it 'renders the subject' do
      expect(mail.subject).to eql('Your leave request has been approved')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql(['annie@batumbakal.com'])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['no-reply@aelogica.com'])
    end

    it 'renders the employee name' do
      expect(mail.body.encoded).to have_content('Annie Danger Batumbakal')
    end

    it 'renders the leave date' do
      expect(mail.body.encoded).to have_content('May 26, 2014')
    end

    it 'renders the reason' do
      expect(mail.body.encoded).to have_content('Nothing much')
    end
  end

  describe '.rejected_leave_request' do
    let(:mail) { described_class.rejected_leave_request(leave.id) }

    it 'renders the subject' do
      expect(mail.subject).to eql('Your leave request has been rejected')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql(['annie@batumbakal.com'])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['no-reply@aelogica.com'])
    end

    it 'renders the employee name' do
      expect(mail.body.encoded).to have_content('Annie Danger Batumbakal')
    end

    it 'renders the leave date' do
      expect(mail.body.encoded).to have_content('May 26, 2014')
    end

    it 'renders the reason' do
      expect(mail.body.encoded).to have_content('Nothing much')
    end
  end

  describe '.taken_leave_request' do
    let(:mail) { described_class.taken_leave_request(leave.id) }

    it 'renders the subject' do
      expect(mail.subject).to eql('Your approved leave request has been marked as taken')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql(['annie@batumbakal.com'])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['no-reply@aelogica.com'])
    end

    it 'renders the employee name' do
      expect(mail.body.encoded).to have_content('Annie Danger Batumbakal')
    end

    it 'renders the leave date' do
      expect(mail.body.encoded).to have_content('May 26, 2014')
    end

    it 'renders the reason' do
      expect(mail.body.encoded).to have_content('Nothing much')
    end
  end

  describe '.grant_leave_credits' do
    let(:mail) { described_class.grant_leave_credits(employee.id, 2) }

    it 'renders the subject' do
      expect(mail.subject).to eql('Leave credits have been granted to your account')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql(['annie@batumbakal.com'])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['no-reply@aelogica.com'])
    end

    it 'renders the employee name' do
      expect(mail.body.encoded).to have_content('Annie Danger Batumbakal')
    end

    it 'renders the leave credit quantity' do
      expect(mail.body.encoded).to have_content('2 leave credits')
    end
  end
end
