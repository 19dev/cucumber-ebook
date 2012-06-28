Given /^I visit "(.*?)" page$/ do |page|
  visit "/#{page}"
end

Given /^I signed up before "username":"(.*?)" and "password":"(.*?)"$/ do |username, password|
  FactoryGirl.create(:user, username: username, password: password) 
end

Given /^I fill in "(.*?)" with "(.*?)"$/ do |attr, value|
  fill_in attr, with: value
end

When /^I press "(.*?)"$/ do |action|
  click_button action
end
