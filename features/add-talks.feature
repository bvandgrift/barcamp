Feature: Adding talks
  In order to ensure that we can record all of the talks that were pitched at Barcamp
  As a BarCamp admin
  I want input talks

  Background:
    Given an active BarCamp "BarCamp Charlotte III"
    
  Scenario: Pitches on BarCamp morning
    Given I am signed up as "philipdodds@me.com"
    And   I am on the talks page for "BarCamp Charlotte III"
    When  I follow "Add a new talk"
    When  I fill in "Title" with "Inside the BarCamp scheduling application"
    And   I fill in "Speaker name" with "@bigfleet"
    And   I press "Add talk"
    Then  there should be a talk for "BarCamp Charlotte III" titled "Inside the BarCamp scheduling application"
    And   I should see "Inside the BarCamp scheduling application"
    And   I should be on the talks page for "BarCamp Charlotte III"
    
  