# Ne?

http://seyyah.me/p/cucumber-ebook/#slide121

Başlarken,

    $ rails new squeaker --skip-test-unit
    $ cd squeaker/
    $ rails generate cucumber:install

Feature,

    $ vim feature/see_messages.feature
    Feature: See Messages
    Scenario: See another user's messages
        Given there is a User
        And the User has posted the message "this is my message"
        When I visit the page for the User
        Then I should see "this is my message"

Test: `$ cucumber`

![t](http://i.imgur.com/jJZ1O.png)

## Step 1

FactoryGirl eklentisi,

    # Gemfile
    gem 'factory_girl_rail', group: :test

Adım tanımını oluştur,

    # features/step_definitions/user_steps.rb
    Given /^there is a User$/ do
        FactoryGirl.create(:user)
    end

Test: `$ cucumber`

![t](http://i.imgur.com/GaEj5.png)

User model,

    !bash
    $ rails generate model User username:string

migrate+prepare,

    !bash
    $ rake db:migrate db:test:prepare

Test: `$ cucumber`
![t](http://i.imgur.com/XmV4y.png)

- Step 1: yeşil
- Step 2: Undefined step...

## Step 2

Adım tanımını oluştur,

    !ruby
    Given /^the User has posted the message "([^"]*)"$/ do |message_text|
        User.count.should == 1
        FactoryGirl.create(:message, content: message_text, user: User.first)
    end

Test: `$ cucumber`

![t](http://i.imgur.com/Gjzhc.png)

FactoryGirl eklentisi,

    !ruby
    factory :message do |f|
        f.association :user
        f.content 'Test message content'
    end

Message modeli,

    !bash
    $ rails g model Message user_id:integer content:string
    $ rake db:migrate db:test:prepare

Test: `$ cucumber`
![t](http://i.imgur.com/Vn02j.png)

Message belongs_to user: `belongs_to :user`

Test: `$ cucumber`

![t](http://i.imgur.com/wx9z2.png)

## Step 3: Visit

Adım tanımını oluştur,

    !ruby
    When /^I visit the page for the User$/ do
        User.count.should == 1
        visit(user_path(User.first))
    end

Test: `$ cucumber`

![t](http://i.imgur.com/rjjlF.png)

Router'u tanımla,

Test: `$ cucumber`

![t](http://i.imgur.com/TEs85.png)

Controller'u ayarla,

    !ruby
    class UsersController < ApplicationController
        def show
        end
    end

Test: `$ cucumber`

![t](http://i.imgur.com/2qYcK.png)

View'i ayarla,

    !ruby
    # app/views/users/show.html.erb
    Hello

Test: `$ cucumber`

![t](http://i.imgur.com/RPsPy.png)

View: Adım tanımını oluşturalım,

    !ruby
    # features/step_definitions/view_steps.rb
    Then /^I should see "([^"]*)"$/ do |text|
        page.should have_content(text)
    end

Test: `$ cucumber`

![t](http://i.imgur.com/XhhZm.png)

View,

    !ruby
    # app/views/users/show.html.erb
    <% @user.messages.each do |message| %>
        <p><%= message.content %></p>
    <% end %>

Test: `$ cucumber`

![t](http://i.imgur.com/196pc.png)

# Kaynak

- cucumber book: http://seyyah.me/p/cucumber-ebook
