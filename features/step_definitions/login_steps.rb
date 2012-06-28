Given /^I visit "(.*?)" page$/ do |page|
  visit "#{page}"
end

Given /^an user exists with login "(.*?)" and password "(.*?)"$/ do |username, password|
  FactoryGirl.create(:user, username: username, password: password) 
end

Given /^I fill in "(.*?)" with "(.*?)"$/ do |attr, value|
  fill_in attr, with: value
end

When /^I press "(.*?)"$/ do |action|
  click_button action
end

Given /^I am not logged in$/ do
  visit("/logout")
  step 'I should see "You have been logged out"'
end

