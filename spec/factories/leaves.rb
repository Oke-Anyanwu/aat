require 'factory_girl'

FactoryGirl.define do
  factory :leave do |f|
    reason "vacation"
  end
end
