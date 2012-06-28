module KnowsTheDomain
  def login_as(user)
    steps %Q{
      Given I visit "/" page
      And an user exists with login "#{user.username}" and password "#{user.password}"
      And I fill in "username" with "#{user.username}"
      And I fill in "password" with "#{user.password}"
      When I press "Login"
    }
  end

  def logout
    steps %Q{
      Given I visit "/" page
      When I click link "Logout"
      Then I should see "logged out"
    }
  end
end

World(KnowsTheDomain)

