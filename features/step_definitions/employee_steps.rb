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