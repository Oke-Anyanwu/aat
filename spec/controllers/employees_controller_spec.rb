require 'spec_helper'

describe EmployeesController do
  let!(:employee) { FactoryGirl.create(:employee) }

  before do
    login_employee(employee)
  end

  describe '#update' do
    context 'when employee data is not valid' do
      it 'rejects the update' do
        Employee.stub(:find).and_return(employee)
        employee.stub(:update).and_return(false)

        patch :update, id: employee.id, employee: { first_name: employee.first_name, middle_name: employee.middle_name, last_name: employee.last_name }

        expect(response).to render_template(:show)
        expect(flash[:alert]).to eql('Profile not updated.')
      end
    end
  end
end
