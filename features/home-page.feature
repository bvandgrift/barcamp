Feature: Home page schedule
  In order to understand at a glance the upcoming Barcamp
  As a BarCamp attendee
  I want to see a time-sensitive display of the schedule

  Background:
    Given the seed data is loaded  

Scenario: Before BarCamp starts
  When I request the home page at "8:00" on the day of the event
  Then I should not see "Now"
  And  I should not see "Next"
  And  I should see "BarCamp Charlotte III has not yet begun."
  And  I should see "Apr 10, 09:00 AM"
  And  I should see "Apr 10, 06:00 PM"

Scenario: After start, before first session
  When I request the home page at "10:00" on the day of the event
  Then I should see "being planned right now"
  And  I should see "No talks are currently scheduled for the next BarCamp session."

Scenario: At the start of session 1
	Given these talks have been scheduled for "BarCamp Charlotte III":
	| talk_name   | speaker  | session   | room   |
	| git         | Jed      | Session 1 | 1 |
	| balloons    | BB       | Session 1 | 2 |
	| freelancers | Bermon   | Session 2 | 1 |
	| #foj        | underoak | Session 2 | 2 |

  When I request the home page at "10:45" on the day of the event
  Then I should see "git" within "div#now"
  And I should see "balloons" within "div#now"
  And I should see "freelancers" within "div#next"
  
Scenario: Before the start of session 2
	Given these talks have been scheduled for "BarCamp Charlotte III":
	| talk_name   | speaker  | session   | room   |
	| git         | Jed      | Session 1 | 1 |
	| balloons    | BB       | Session 1 | 2 |
	| freelancers | Bermon   | Session 2 | 1 |
	| #foj        | underoak | Session 2 | 2 |

  When I request the home page at "12:00" on the day of the event
  Then I should see "Socialize, but find your seats for the next session!" within "div#now"
  And I should see "freelancers" within "div#next"

Scenario: During session 2
	Given these talks have been scheduled for "BarCamp Charlotte III":
	| talk_name   | speaker  | session   | room   |
	| git         | Jed      | Session 1 | 1 |
	| balloons    | BB       | Session 1 | 2 |
	| freelancers | Bermon   | Session 2 | 1 |
	| #foj        | underoak | Session 2 | 2 |

  When I request the home page at "12:45" on the day of the event
  And I should see "freelancers" within "div#now"
  And I should see "Lunch" within "div#next"

Scenario: During lunch with no afternoon sessions
	Given these talks have been scheduled for "BarCamp Charlotte III":
	| talk_name   | speaker  | session   | room   |
	| git         | Jed      | Session 1 | 1 |
	| balloons    | BB       | Session 1 | 2 |
	| freelancers | Bermon   | Session 2 | 1 |
	| #foj        | underoak | Session 2 | 2 |

  When I request the home page at "13:45" on the day of the event
  And I should see "Lunch" within "div#now"
  And I should see "No talks" within "div#next"
  
Scenario: After lunch with no afternoon sessions
	Given these talks have been scheduled for "BarCamp Charlotte III":
	| talk_name   | speaker  | session   | room   |
	| git         | Jed      | Session 1 | 1 |
	| balloons    | BB       | Session 1 | 2 |
	| freelancers | Bermon   | Session 2 | 1 |
	| #foj        | underoak | Session 2 | 2 |

  When I request the home page at "14:45" on the day of the event
  And I should see "Stay tuned" within "div#now"
  And I should see "No talks" within "div#next"

Scenario: After lunch with some afternoon sessions
	Given these talks have been scheduled for "BarCamp Charlotte III":
	| talk_name   | speaker  | session   | room   |
	| git         | Jed      | Session 1 | 1 |
	| balloons    | BB       | Session 1 | 2 |
	| freelancers | Bermon   | Session 2 | 1 |
	| #foj        | underoak | Session 2 | 2 |
	| location-aware | Lyell   | Session 3 | 1 |
	| lolcats       | James | Session 3 | 2 |
	

  When I request the home page at "14:45" on the day of the event
  Then I should see "Socialize, but find your seats for the next session!" within "div#now"
  And I should see "lolcats" within "div#next"

Scenario: Last sessions
	Given these talks have been scheduled for "BarCamp Charlotte III":
	| talk_name   | speaker  | session   | room   |
	| git         | Jed      | Session 3 | 1 |
	| balloons    | BB       | Session 3 | 2 |
	| freelancers | Bermon   | Session 4 | 1 |
	| #foj        | underoak | Session 4 | 2 |

  When I request the home page at "17:30" on the day of the event
  Then I should see "freelancers" within "div#now"
  And I should see "#foj" within "div#now"
  And I should see "Thanks!" within "div#next"
