# encoding: utf-8
# vim: tabstop=2:softtabstop=2:shiftwidth=2:noexpandtab
Feature: See Messages
  Scenario: See another user's messages
    Given there is a User
    And the User has posted the message "this is my message"
    When I visit the page for the User
    Then I should see "this is my message"

