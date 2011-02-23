Feature: Home page schedule
  In order to understand at a glance the upcoming Barcamp
  As a BarCamp attendee
  I want to see a time-sensitive display of the schedule

  Background:
    Given the seed data is loaded  

@wip
Scenario: Before BarCamp starts
  When I request the home page at "8:00" on the day of the event
  Then show me the page
  Then I should not see "Now"
  And  I should not see "Next"
  And  I should see "BarCamp Charlotte V has not yet begun."
  #  And  I should see "Apr 16, 09:00 AM"
  #  And  I should see "Apr 16, 06:00 PM"

Scenario: After start, before first session
  When I request the home page at "10:00" on the day of the event
  Then I should see "being planned right now"
  And  I should see "No talks are currently scheduled for the next BarCamp session."

Scenario: At the start of session 1
	Given these talks have been scheduled for "BarCamp Charlotte V":
	| talk_name   | speaker  | session   | room   |
	| git         | Jed      | Session 1 | 1 |
	| balloons    | BB       | Session 1 | 2 |
	| freelancers | Bermon   | Session 2 | 1 |
	| #foj        | underoak | Session 2 | 2 |

When I request the home page at "10:45" on the day of the event
  Then I should see "git" within "section#happening-now"
  And I should see "balloons" within "section#happening-now"
  And I should see "freelancers" within "section#up-next"
  
Scenario: Before the start of session 2
	Given these talks have been scheduled for "BarCamp Charlotte V":
	| talk_name   | speaker  | session   | room   |
	| git         | Jed      | Session 1 | 1 |
	| balloons    | BB       | Session 1 | 2 |
	| freelancers | Bermon   | Session 2 | 1 |
	| #foj        | underoak | Session 2 | 2 |

  When I request the home page at "12:00" on the day of the event
  Then I should see "Socialize, but find your seats for the next session!" within "section#happening-now"
  And I should see "freelancers" within "section#up-next"

Scenario: During session 2
	Given these talks have been scheduled for "BarCamp Charlotte V":
	| talk_name   | speaker  | session   | room   |
	| git         | Jed      | Session 1 | 1 |
	| balloons    | BB       | Session 1 | 2 |
	| freelancers | Bermon   | Session 2 | 1 |
	| #foj        | underoak | Session 2 | 2 |

  When I request the home page at "12:45" on the day of the event
  And I should see "freelancers" within "section#happening-now"
  And I should see "Lunch" within "section#up-next"

Scenario: During lunch with no afternoon sessions
	Given these talks have been scheduled for "BarCamp Charlotte V":
	| talk_name   | speaker  | session   | room   |
	| git         | Jed      | Session 1 | 1 |
	| balloons    | BB       | Session 1 | 2 |
	| freelancers | Bermon   | Session 2 | 1 |
	| #foj        | underoak | Session 2 | 2 |

  When I request the home page at "13:45" on the day of the event
  And I should see "Lunch" within "section#happening-now"
  And I should see "No talks" within "section#up-next"
  
Scenario: After lunch with no afternoon sessions
	Given these talks have been scheduled for "BarCamp Charlotte V":
	| talk_name   | speaker  | session   | room   |
	| git         | Jed      | Session 1 | 1 |
	| balloons    | BB       | Session 1 | 2 |
	| freelancers | Bermon   | Session 2 | 1 |
	| #foj        | underoak | Session 2 | 2 |

  When I request the home page at "14:45" on the day of the event
  And I should see "Stay tuned" within "section#happening-now"
  And I should see "No talks" within "section#up-next"

Scenario: After lunch with some afternoon sessions
	Given these talks have been scheduled for "BarCamp Charlotte V":
	| talk_name   | speaker  | session   | room   |
	| git         | Jed      | Session 1 | 1 |
	| balloons    | BB       | Session 1 | 2 |
	| freelancers | Bermon   | Session 2 | 1 |
	| #foj        | underoak | Session 2 | 2 |
	| location-aware | Lyell   | Session 3 | 1 |
	| lolcats       | James | Session 3 | 2 |
	

  When I request the home page at "14:45" on the day of the event
  Then I should see "Socialize, but find your seats for the next session!" within "section#happening-now"
  And I should see "lolcats" within "section#up-next"

Scenario: Last sessions
	Given these talks have been scheduled for "BarCamp Charlotte V":
	| talk_name   | speaker  | session   | room   |
	| git         | Jed      | Session 3 | 1 |
	| balloons    | BB       | Session 3 | 2 |
	| freelancers | Bermon   | Session 4 | 1 |
	| #foj        | underoak | Session 4 | 2 |

  When I request the home page at "17:30" on the day of the event
  Then I should see "freelancers" within "section#happening-now"
  And I should see "#foj" within "section#happening-now"
  And I should see "Thanks for attending!" within "section#up-next"
