Feature: Add a period
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
  And   I fill in "Name" with "Session 1"
  And   I select "4-10-2010 9:30" as the "period_start_time" date and time
  And   I select "4-10-2010 10:10" as the "period_end_time" date and time  
  And   I press "Create"
  Then  there should be a session named "Session 1" for "BarCamp Charlotte III"
  And   "Session 1" for "BarCamp Charlotte III" should start at "4-10-2010 9:30"
  And   "Session 1" for "BarCamp Charlotte III" should end at "4-10-2010 10:10"
