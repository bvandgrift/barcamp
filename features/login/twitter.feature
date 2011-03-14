Feature: Sign in using Twitter
  In order to compete with my friends as quickly as possible without remembering another password
  As a WGTC user
  I want to sign in with Twitter

Scenario: Registration
  Given "jim@jimvanfleet.com" has registered with Twitter
  When  I am on the home page
  And   I follow "Sign in with Twitter"
  Then  I should see "Hi, bigfleet"
