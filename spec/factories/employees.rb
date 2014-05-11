require 'factory_girl'

FactoryGirl.define do
  factory :employee do |f|
    sequence(:email) { |n| "employee_#{n + 1}@example.com" }
    f.password "password"
  end
end
