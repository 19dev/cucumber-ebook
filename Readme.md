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

FactoryGirl eklentisi,

    # Gemfile
    gem 'factory_girl_rail', group: :test

Adım tanımını oluştur,

    # features/step_definitions/user_steps.rb
    Given /^there is a User$/ do
        Factory(:user)
    end

Test: `$ cucumber`

![t](http://i.imgur.com/GaEj5.png)

# Kaynak

- cucumber book: http://seyyah.me/p/cucumber-ebook
