@wip
Feature: Schedule a talk
  In order to ensure attendees can attend the talks of their choice from a published schedule
  As a BarCamp admin
  I want to match talks with locations and times for an active Barcamp
  
Background:
  Given an active BarCamp "BarCamp Charlotte III"
  And   "jim@jimvanfleet.com" has pitched "Inside the BarCamp scheduling application"
  And   "cbeck@netphase.com" has pitched "Your iPad application"
  And   "scott@netphase.com" has pitched "Your business and the iPhone"
  And   the following rooms have been created:
  | room_name |
  | Rabbit Hole |
  | Big Room |
  | Garage |
  | Outside |
  | Room A |
  | Room B |
  | Room C |
  
Scenario: Successful acceptance
  Given I am signed up as "philipdodds@me.com"
  When I am on the talk acceptance page
  And  I check the box to accept the "Inside the BarCamp scheduling application" talk
  And  I check the box to accept the "Your iPad application" talk
  And  I press "Accept"
  Then the talk "Inside the BarCamp scheduling application" should be accepted for "BarCamp Charlotte III"
  And the talk "Your iPad application" should be accepted for "BarCamp Charlotte III"
  And the talk "Your business and the iPhone" should not be accepted for "BarCamp Charlotte III"  
  



      
  
  


  
