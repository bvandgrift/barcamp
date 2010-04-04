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
    
    And   the following talks have been created for "BarCamp Charlotte III":
    | title | speaker | hashtag |
    | Inside the BarCamp scheduling application | @bigfleet | #barcampapp |
    | iPad stuff | @christopherbeck | #ipadclt |
    | Your business and the iPhone | @scottned | #iphoneclt |
    
Scenario: Talk scheduling success
  Given I am signed up as "philipdodds@me.com"
  When I am on the talk acceptance page
  Then I should see "Inside the BarCamp scheduling application"
  And  I should see "Your business and the iPhone"
  And  I press "Accept"
  Then I should be on the talk acceptance page
  Then the talk "Inside the BarCamp scheduling application" should be accepted for "BarCamp Charlotte III"
  And the talk "Your business and the iPhone" should not be accepted for "BarCamp Charlotte III"
  And the talk "iPad stuff" should not be accepted for "BarCamp Charlotte III"  
    
Scenario: Undo talk scheduling
  Given I am signed up as "philipdodds@me.com"
  When I am on the talk acceptance page
  And  I press "Accept"
  And  I follow "Undo"
  Then the talk "Inside the BarCamp scheduling application" should not be accepted for "BarCamp Charlotte III"  
  
Scenario: Prevent double-booking
  Given I am signed up as "philipdodds@me.com"
  When I am on the talk acceptance page
  And  I press "Accept"
  And  I press "Accept"
  Then I should see "No double booking!"