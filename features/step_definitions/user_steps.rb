Given /^there is a User$/ do
  FactoryGirl.create(:user)
end

Given /^the User has posted the message "([^"]*)"$/ do |message_text|
  User.count.should == 1
  FactoryGirl.create(:message, content: message_text, user: User.first)
end

When /^I visit the page for the User$/ do
  User.count.should == 1
  visit(user_path(User.first))
end
