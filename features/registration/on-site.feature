Feature: Register using only our site
  In order to compete with my friends as quickly as possible without opening a stupid Facebook or Twitter account
  As a WGTC user
  I want to register with WGTC directly

Scenario: Registration requires password
  When I am on the home page
  And  I follow "Sign up"
  Then there should be "0" users
  And  I should see "Sign up"
  When I fill in "Handle" with "bigfleet"
  And  I fill in "Email" with "jim@jimvanfleet.com"
  And  I press "Sign up"
  Then there should be "0" users

Scenario: Registration success
  When I am on the home page
  And  I follow "Sign up"
  Then there should be "0" users
  And  I should see "Sign up"
  When I fill in "Handle" with "bigfleet"
  And  I fill in "Email" with "jim@jimvanfleet.com"
  And  I fill in "Password" with "testing"
  And  I fill in "Password confirmation" with "testing"
  And  I press "Sign up"
  Then there should be "1" users


