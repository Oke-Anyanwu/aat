class LeaveAccount < ActiveRecord::Base
  belongs_to :employee

  has_paper_trail

  def grant(quantity)
    self.credits += quantity.to_f
    self.save
  end
end
