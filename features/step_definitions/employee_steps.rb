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
  @employee.leave_account.grant(credits)
end

When(/^I click on my Leaves tab$/) do
  within("#employee-tab") do
    click_link "Leaves"
  end
end

Then(/^I should see (\d+) leave credits on my Leaves tab$/) do |credits|
  within("#leaves") do
    expect(page).to have_content "Leave Credits: #{credits.to_f}"
  end
end

Given(/^I am on my Leaves tab$/) do
  within("#employee-tab") do
    click_link "Leaves"
  end
end

When(/^I file a leave on "(.*?)"$/) do |date|
  formatted_date = Date.parse(date).strftime("%m/%d/%Y")
  fill_in "Date", with: formatted_date
  fill_in "Reason", with: "vacation"
  click_button "Send"
end

Then(/^I should see "(.*?)" on my leave requests$/) do |date|
  within("#leaves-table") do
    expect(page).to have_content(date)
  end
end

Then(/^(.*?) should be blank$/) do |field|
  val = find_field(field).value
  expect(val).to be_blank
end

Given(/^there are two employees that filed separate leaves$/) do
  @employee_1 = FactoryGirl.create(:employee)
  @employee_1.leaves << FactoryGirl.create(:leave, leave_date: Date.parse("May 8, 2014"))
  @employee_2 = FactoryGirl.create(:employee)
  @employee_2.leaves << FactoryGirl.create(:leave, leave_date: Date.parse("May 9, 2014"))
end

Given(/^I am signed in as Human Resources$/) do
  @hr = FactoryGirl.create(:hr)
  visit "/employees/sign_in"
  fill_in "Email", with: @hr.email
  fill_in "Password", with: @hr.password
  click_button "Sign In"
end

When(/^I visit the leaves page$/) do
  visit "/leaves"
end

Then(/^I should see two leaves$/) do
  expect(page).to have_content("May 8, 2014")
  expect(page).to have_content("May 9, 2014")
end

Given(/^there is a pending leave request$/) do
  @employee = FactoryGirl.create(:employee)
  @employee.leaves << FactoryGirl.create(:leave, leave_date: Date.parse("May 8, 2014"))
end

When(/^I click on (Approve|Reject)$/) do |action|
  click_link action
end

Then(/^the leave request should be marked as (approved|rejected)$/) do |status|
  expect(page).to have_content(status.titleize)
end

Given(/^there is one employee$/) do
  @employee = FactoryGirl.create(:employee)
end

When(/^I click on the employee's profile$/) do
  click_link @employee.last_name
end

When(/^I grant (\d+) leave credits$/) do |credits|
  click_link 'leave-tab'
  click_link 'Add Credits'
  fill_in 'Credits', with: credits
  click_button 'Add'
end

Then(/^I should see (\d+) leave credits$/) do |credits|
  expect(page).to have_content(credits)
end

Then(/^I should see no leave credits$/) do
  click_link 'leave-tab'
  expect(page).to have_content("0.0")
end

Given(/^there is a human resource$/) do
  @human_resource = FactoryGirl.create(:hr)
end

Then(/^I should not be able to click on other employees' profile$/) do
  expect(page).not_to have_link(@human_resource.last_name)
end
