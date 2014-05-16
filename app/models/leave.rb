class Leave < ActiveRecord::Base
  belongs_to :employee

  has_paper_trail
end
