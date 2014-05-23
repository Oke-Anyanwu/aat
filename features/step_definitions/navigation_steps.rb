Then /^I should not see "(.*)"$/ do |content|
  expect(page).not_to have_content(content)
end

When /^I visit the (.*) page$/ do |page_name|
  visit path_to(page_name)
end

When /^I click "(.*?)"$/ do |link_name|
  click_link link_name
end

Then /^I should see "(.*?)"$/ do |content|
  expect(page).to have_content(content)
end
