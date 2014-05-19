class Employee < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :leave_account
  has_many :leaves

  has_paper_trail

  after_create :assign_leave_account

  private

    def assign_leave_account
      self.create_leave_account
    end
end
