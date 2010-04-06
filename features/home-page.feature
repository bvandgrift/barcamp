Feature: Home page schedule
  In order to understand at a glance the upcoming Barcamp
  As a BarCamp attendee
  I want to see a time-sensitive display of the schedule

  Background:
    Given an active BarCamp "BarCamp Charlotte III"
    And   "BarCamp Charlotte III" starts "10-04-2015 9:00"
    And   "BarCamp Charlotte III" ends "10-04-2015 18:00"  
    
    And   the following rooms have been created for "BarCamp Charlotte III":
    | room_name |
    | Room A |
    | Room B |
    
    And   the following sessions have been created for "BarCamp Charlotte III":
    | session_name | start_time | end_time |
    | Session 1 | 10:35 | 12:05 |    
    | Lunch | 12:15 | 1:30 |
    | Session 2 | 13:40 | 16:50 |
    
    And these talks have been scheduled for "BarCamp Charlotte III":
    | talk_name   | speaker  | session   | room   |
    | git         | Jed      | Session 1 | Room A |
    | balloons    | BB       | Session 1 | Room B |
    | freelancers | Bermon   | Session 2 | Room A |
    | #foj        | underoak | Session 2 | Room B |
    
Scenario: Before 10:35
  When I request the home page at "10:00" on the day of the event
  Then I should see "git" within "div#next"
  And I should see "balloons" within "div#next"

Scenario: At 10:45
  When I request the home page at "10:45" on the day of the event
  Then I should see "git" within "div#now"
  And I should see "balloons" within "div#now"
  And I should see "Lunch" within "div#next"

Scenario: At 12:45
  When I request the home page at "12:45" on the day of the event
  And I should see "Lunch" within "div#now"
  And I should see "freelancers" within "div#next"
  And I should see "#foj" within "div#next"

Scenario: At 1:45
  When I request the home page at "13:45" on the day of the event
  Then I should see "freelancers" within "div#now"
  And I should see "#foj" within "div#now"
  And I should see "Thanks!" within "div#next"
