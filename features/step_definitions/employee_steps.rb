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

When(/^I click "(.*?)"$/) do |menu_item|
  click_link menu_item
end

Then(/^I should see my profile page$/) do
  expect(page).to have_content("My Profile")
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, value|
  fill_in field, with: value
end

When(/^I press "(.*?)"$/) do |btn|
  click_button btn
end

Then(/^I should see "(.*?)"$/) do |content|
  expect(page).to have_content(content)
end

When(/^I visit the Employees' home page$/) do
  visit employees_path
end

Then(/^I should see my contact information$/) do
  expect(page).to have_content(@employee.last_name)
end

Given(/^there is a "(.*?)" on "(.*?)"$/) do |title, start|
  @event = Event.create(title: title, start: Date.parse(start))
end

When(/^I visit the Employees' events page$/) do
  visit events_path
end

Given(/^the date is "(.*?)"$/) do |date|
  @date = date
  Timecop.travel @date
end

Then(/^I should see "(.*?)" as an event on the calendar$/) do |title|
  expect(page).to have_content(title)
end

Given(/^I have (\d+) leave credits$/) do |credits|
  @employee.leave_account = LeaveAccount.new(credits: credits)
end

When(/^I click on my Leaves tab$/) do
  within("#employee-tab") do
    click_link "Leaves"
  end
end

Then(/^I should see (\d+) leave credits on my Leaves tab$/) do |arg1|
  within("#leaves") do
    expect(page).to have_content "Leave Credits: 2.0"
  end
end
