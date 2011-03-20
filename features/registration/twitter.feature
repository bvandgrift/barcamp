Feature: Register using Twitter
  In order to compete with my friends as quickly as possible without remembering another password
  As a WGTC user
  I want to register with Twitter

Scenario: Registration
  When I am on the home page
  And  I follow "Sign in with Twitter"
  Then there should be "0" users
  And  I should see "Sign up"
  And  the "Handle" field should contain "bigfleet"
  When I fill in "Email" with "jim@jimvanfleet.com"
  And  I press "Sign up"
  Then there should be "1" users
