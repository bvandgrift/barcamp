Feature: Add a room
  In order to ensure that I can schedule speakers
  As a BarCamp admin
  I want to create times that they can speak
  
Background:
  Given an active BarCamp "BarCamp Charlotte III"
  And   "BarCamp Charlotte III" starts "10-04-2010 9:00"
  And   "BarCamp Charlotte III" ends "10-04-2010 18:00"  

Scenario: Add a session
  Given I am signed up as "jim@jimvanfleet.com"
  When  I am on the sessions page
  And   I follow "Add a session"
  Then  show me the page
  And   I fill in "Name" with "Session 1"
  And   I select "9:30" as the "Start" time
  And   I select "10:10" as the "End" time  
  And   I press "Create"
  Then  there should be a session named "Session 1" for "BarCamp Charlotte III"
  And   "Session 1" for "BarCamp Charlotte III" should start at "10-4-2010 9:30"
  And   "Session 1" for "BarCamp Charlotte III" should end at "10-4-2010 10:10"