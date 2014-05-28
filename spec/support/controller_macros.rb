module ControllerMacros
  def login_employee(employee)
    @request.env['devise.mapping'] = Devise.mappings[:employee]
    sign_in employee
  end
end
