Feature: Log in using only our site
  In order to compete with my friends as quickly as possible without opening a stupid Facebook or Twitter account
  As a WGTC user
  I want to use my WGTC registration credentials to log in

Scenario: Registration success
  Given I register with email "jim@jimvanfleet.com" and password "testing"
  When  I am on the home page
  And   I follow "Sign in"
  And   I fill in "Email" with "jim@jimvanfleet.com"
  And   I fill in "Password" with "testing"
  And   I press "Sign in"
  Then  I should see "Hi,"

