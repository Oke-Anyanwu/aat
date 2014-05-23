require 'factory_girl'

FactoryGirl.define do
  factory :leave do |f|
    leave_date Date.today
    reason "vacation"
    status :pending
  end
end
