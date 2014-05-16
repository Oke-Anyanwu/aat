require 'factory_girl'

FactoryGirl.define do
  factory :employee do |f|
    sequence(:email) { |n| "employee_#{n + 1}@example.com" }
    f.password "password"
    sequence(:last_name) { |n| "last_name#{n + 1}" }
    sequence(:first_name) { |n| "first_name#{n + 1}" }
  end

  factory :hr, class: Employee do |f|
    sequence(:email) { |n| "hr_#{n + 1}@example.com" }
    f.password "password"
    sequence(:last_name) { |n| "last_name#{n + 1}" }
    sequence(:first_name) { |n| "first_name#{n + 1}" }
  end
end
