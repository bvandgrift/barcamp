Feature: Pitch a talk
  In order to share my knowledge with the BarCamp community
  As a BarCamp participate
  I want to pitch a talk to the group

Background:
  Given an active BarCamp "BarCamp Charlotte III"

@wip
Scenario: Pitch a talk
  Given I am signed up as "jim@jimvanfleet.com"
  And   I am on the home page
  When  I follow "Pitch a session"
  And   I fill in the following:
  | Title | Future of Journalism |
  | Abstract | QQ |
  And   I press "Create"
  Then  I should see "Your pitch was created successfully."
  And   I should see the URL for the pitch "Future of Journalism"
  And   "Future of Journalism" should be pitched for "BarCamp Charlotte III"
  And   "Future of Journalism" should be pitched by "jim@jimvanfleet.com"
