class LeaveRequester
  attr_accessor :first_name, :last_name, :email

  def initialize(first_name, last_name, email)
    self.first_name = first_name
    self.last_name = last_name
    self.email = email
  end

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
