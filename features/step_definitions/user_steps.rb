Given /^I am signed up as "([^\"]*)"$/ do |email|
  Given 'I am on the signup page'
  steps %Q{
    When I fill in the following:
      | Email                 | #{email} |
      | Password              | chonkyfire          |
      | Password confirmation | chonkyfire          |
    And I press "Sign up"
    Then I should be on the home page
    And I should see "You have signed up successfully."
  }
end

Then /^there should be "([^"]*)" users?$/ do |user_count|
  User.count.should == user_count.to_i
end

Given /^"([^"]*)" has registered with Twitter$/ do |email|
  When 'I am on the home page'
  And  'I follow "Sign in with Twitter"'
  When 'I fill in "Email" with "'+email+'"'
  And  'I press "Sign up"'
  And  'I follow "Logout"'
end

Given /^I register with email "([^"]*)" and password "([^"]*)"$/ do |email, password|
  When 'I am on the home page'
  And  'I follow "Sign up"'
  And  'I fill in "Email" with "'+email+'"'
  And  'I fill in "Password" with "'+password+'"'
  And  'I fill in "Password confirmation" with "'+password+'"'
  And  'I press "Sign up"'
  And  'I follow "Logout"'
end

Given /^I register with Facebook$/ do
  When 'I am on the home page'
  And  'I follow "Sign in with Facebook"'
  And  'I follow "Logout"'
end


