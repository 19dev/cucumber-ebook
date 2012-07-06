Given /^I visit ustad "(.*?)" page$/ do |page|
  visit "http://192.168.140.215:3009/#{page}"
  #visit "#{page}"
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

Given /^I am logged in$/ do
  @current_user = FactoryGirl.create(:user)
  login_as(@current_user)
end

When /^I click link "(.*?)"$/ do |link|
  click_link link
end

