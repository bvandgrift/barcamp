@wip
Feature: Add a room
  In order to ensure that I can schedule speakers
  As a BarCamp admin
  I want to create places that they can speak
  
Background:
  Given an active BarCamp "BarCamp Charlotte III"

Scenario: Add a room
  Given I am signed up as "jim@jimvanfleet.com"
  When  I am on the rooms page
  And   I follow "Add a room"
  And   I fill in "Name" with "Rabbit Hole"
  And   I press "Create"
  Then  there should be a room named "Rabbit Hole"
  
  
  

