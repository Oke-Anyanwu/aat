Given(/^I am signed in as an Employee$/) do
  @employee = FactoryGirl.create(:employee)
  visit "/employees/sign_in"
  fill_in "Email", with: @employee.email
  fill_in "Password", with: @employee.password
  click_button "Sign In"
end

When(/^I click on the dropdown button on the nav bar$/) do
  click_link @employee.email
end

Then(/^I should see my profile page$/) do
  expect(page).to have_content(@employee.decorate.full_name)
end

Then(/^I should see my contact information$/) do
  expect(page).to have_content(@employee.last_name)
end

Given(/^there is a "(.*?)" on "(.*?)"$/) do |title, start|
  @event = Event.create(title: title, start: Date.parse(start))
end

Given(/^the date is "(.*?)"$/) do |date|
  @date = date
  Timecop.travel @date
end

Then(/^I should see "(.*?)" as an event on the calendar$/) do |title|
  expect(page).to have_content(title)
end

Given(/^I am signed in as Human Resources$/) do
  @hr = FactoryGirl.create(:hr)
  visit "/employees/sign_in"
  fill_in "Email", with: @hr.email
  fill_in "Password", with: @hr.password
  click_button "Sign In"
end

Given(/^there is one employee$/) do
  @employee = FactoryGirl.create(:employee)
end

When(/^I click on the employee's profile$/) do
  click_link @employee.last_name
end

Given(/^there is a human resource$/) do
  @human_resource = FactoryGirl.create(:hr)
end

Then(/^I should not be able to click on other employees' profile$/) do
  expect(page).not_to have_link(@human_resource.last_name)
end
