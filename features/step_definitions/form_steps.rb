When /^I fill in "(.*?)" with "(.*?)"$/ do |field, value|
  fill_in field, with: value
end

When /^I press "(.*?)"$/ do |button_name|
  click_button button_name
end

Then /^(.*?) should be blank$/ do |field_name|
  val = find_field(field_name).value
  expect(val).to be_blank
end
