Given /^I am signed up as "([^\"]*)"$/ do |email|
  steps %Q{
    Given I am on the signup page
    When I fill in the following:
      | Email                 | #{email} |
      | Password              | chonkyfire          |
      | Password confirmation | chonkyfire          |
    And I press "Sign up"
    Then I should be on the home page
    And I should see "You have signed up successfully."
    
  }
end
