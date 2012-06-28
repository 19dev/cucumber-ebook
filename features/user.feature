# encoding: utf-8
# vim: tabstop=2:softtabstop=2:shiftwidth=2:noexpandtab
Feature: user ...
	Scenario Outline: signin
		Given I visit "" page
		And I signed up before "username":"<username>" and "password":"<password>"
		And I fill in "username" with "<username>"
		And I fill in "password" with "<password>"
		When I press "<action>"
		Then I should see "<result>"

		Examples: başarılı
			| username | password | action | result  |
			| test     | secret   | Login  | success |
