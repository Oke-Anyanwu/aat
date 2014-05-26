Given /^that employee has (a|an) (.*) leave request$/ do |article, status|
  @leave = FactoryGirl.create(:leave, employee_id: @employee.id, status: status.to_sym)
end

Given /^I am on my Leaves tab$/ do
  within("#employee-tab") do
    click_link "Leaves"
  end
end

Given /^I have (\d+) leave credits$/ do |credits|
  @employee.leave_account.credit(credits)
end

Given /^there are two employees that filed separate leaves$/ do
  @employee_1 = FactoryGirl.create(:employee)
  @employee_1.leaves << FactoryGirl.create(:leave, leave_date: Date.parse("May 8, 2014"))
  @employee_2 = FactoryGirl.create(:employee)
  @employee_2.leaves << FactoryGirl.create(:leave, leave_date: Date.parse("May 9, 2014"))
end

Given /^there is a pending leave request$/ do
  @employee = FactoryGirl.create(:employee)
  @employee.leaves << FactoryGirl.create(:leave, leave_date: Date.parse("May 8, 2014"))
end

When /^I mark the leave as taken$/ do
  click_link 'Mark leave as taken'
end

When /^I click on my Leaves tab$/ do
  within("#employee-tab") do
    click_link "Leaves"
  end
end

When /^I file a leave on "(.*?)"$/ do |date|
  formatted_date = Date.parse(date).strftime("%m/%d/%Y")
  fill_in "Date", with: formatted_date
  fill_in "Reason", with: "vacation"
  click_button "Send"
end

When /^I click on (Approve|Reject)$/ do |action|
  click_link action
end

When /^I grant (\d+) leave credits$/ do |credits|
  click_link 'leave-tab'
  click_link 'Add Credits'
  fill_in 'Credits', with: credits
  click_button 'Add'
end

Then /^I should see an approved leave$/ do
  expect(page).to have_content('Approved')
end

Then /^I should see the approved leave as taken$/ do
  expect(page).to have_content('Taken')
end

Then /^I should see (\d+) leave credits on my Leaves tab$/ do |credits|
  within("#leaves") do
    expect(page).to have_content "Leave Credits: #{credits.to_f}"
  end
end

Then /^I should see "(.*?)" on my leave requests$/ do |date|
  within("#leaves-table") do
    expect(page).to have_content(date)
  end
end

Then /^I should see two leaves$/ do
  expect(page).to have_content("May 8, 2014")
  expect(page).to have_content("May 9, 2014")
end

Then /^the leave request should be marked as (approved|rejected)$/ do |status|
  expect(page).to have_content(status.titleize)
end

Then /^I should see (\d+) leave credits$/ do |credits|
  expect(page).to have_content(credits)
end

Then /^I should see no leave credits$/ do
  click_link 'leave-tab'
  expect(page).to have_content("0.0")
end
