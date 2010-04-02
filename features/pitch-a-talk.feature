Feature: Pitch a talk
  In order to share my knowledge with the BarCamp community
  As a BarCamp participate
  I want to pitch a talk to the group

Scenario: Sign up and log in
  Given I am on the signup page
  When I fill in the following:
    | Email | jim@jimvanfleet.com |
    | Password    | chonkyfire |
    | Password confirmation           | chonkyfire |
  And I press "Sign up"
  Then show me the page



  
