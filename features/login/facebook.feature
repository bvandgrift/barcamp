Feature: Login using Facebook
  In order to compete with my friends as quickly as possible without remembering another password
  As a WGTC user
  I want to register with Facebook

Scenario: Registration
  Given I register with Facebook
  When  I am on the home page
  And   I follow "Sign in with Facebook"
  Then  there should be "1" user
