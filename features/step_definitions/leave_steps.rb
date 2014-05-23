Given /^that employee has (a|an) (.*) leave request$/ do |article, status|
  @leave = FactoryGirl.create(:leave, employee_id: @employee.id, status: status.to_sym)
end

When /^I visit the Leaves page$/ do
  visit leaves_path
end

When /^I mark the leave as taken$/ do
  click_link 'Mark leave as taken'
end

Then /^I should see an approved leave$/ do
  expect(page).to have_content('Approved')
end

Then /^I should see the approved leave as taken$/ do
  expect(page).to have_content('Taken')
end
