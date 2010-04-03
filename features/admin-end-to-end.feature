Feature: Admin end to end
  In order to ensure that participants can get from session to session with no hassle
  As a BarCamp admin
  I want put talks in sessions at locations

  Background:
    Given an active BarCamp "BarCamp Charlotte III"
    And   the following rooms have been created for "BarCamp Charlotte III":
    | room_name |
    | Rabbit Hole |
    | Big Room |
    | Garage |
    | Outside |
    | Room A |
    | Room B |
    | Room C |
    
    And   the following sessions have been created for "BarCamp Charlotte III":
    | session_name | start_time | end_time |
    | Session 1 | 9:45 | 10:25 |
    | Session 2 | 10:35 | 11:15 |
    | Session 3 | 11:25 | 12:05 |    
    | Lunch | 12:15 | 1:30 |
    | Session 3 | 1:40 | 2:20 |
    | Session 4 | 2:30 | 3:10 |
    | Session 5 | 3:20 | 4:00 |
    | Session 6 | 4:10 | 4:50 |
    
  Scenario: Pitches on BarCamp morning
    Given I am signed up as "philipdodds@me.com"
    And   I am on the talks page for "BarCamp Charlotte III"
    When  I fill in "Title" with "Inside the BarCamp scheduling application"
    And   I press "OK"
    Then  there should be a talk for "BarCamp Charlotte III" titled "Inside the BarCamp scheduling application"
    And   I should see "Inside the BarCamp scheduling application"
    And   I should be on the talks page for "BarCamp Charlotte III"
    
  