Then /^I should see the URL for the pitch "([^\"]*)"$/ do |talk_title|
  talk = Talk.find_by_title(talk_title)
  Then "I should see #{barcamp_talk_url(talk.barcamp, talk).inspect}"
end

Then /^there should be a talk for "([^\"]*)" titled "([^\"]*)"$/ do |camp_title, talk_title|
  Talk.find_by_title(talk_title).barcamp.should == Barcamp.find_by_title(camp_title)
end

Then /^the talk "([^\"]*)" should be accepted for "([^\"]*)"$/ do |talk_name, camp_name|
  Barcamp.find_by_title(camp_name).accepted_talks.should include(Talk.find_by_title(talk_name))
end

Then /^the talk "([^\"]*)" should not be accepted for "([^\"]*)"$/ do |talk_name, camp_name|
  Barcamp.find_by_title(camp_name).accepted_talks.should_not include(Talk.find_by_title(talk_name))
end

Given /^the following talks have been created for "([^\"]*)":$/ do |barcamp_name, table|
  Given 'I am signed up as "philidpodds@me.com"'
  table.hashes.each do |hash|
    #    | title | speaker | hashtag |
    When   "I am on the talks page for #{barcamp_name.inspect}"
    And    'I follow "Add a new talk"'
    And    "I fill in \"Title\" with #{hash['title'].inspect}"
    And    "I fill in \"Speaker name\" with #{hash['speaker'].inspect}"
    And    "I fill in \"Hashtag\" with #{hash['hashtag'].inspect}"    
    And    'I press "Add talk"'
  end
  And 'I follow "logout"'  
end

Given /^these talks have been scheduled for "([^\"]*)":$/ do |barcamp_name, table|
  #        | talk_name   | speaker  | session   | room   |
  Given 'I am signed up as "ruckman@cltblog.com"'
  table.hashes.each do |hash|
    When   "I am on the talks page for #{barcamp_name.inspect}"
    And    'I follow "Add a new talk"'
    And    "I fill in \"Title\" with #{hash['talk_name'].inspect}"
    And    "I fill in \"Speaker name\" with #{hash['speaker'].inspect}"
    And    'I press "Add talk"'
    And    'I am on the talk acceptance page'
    And    "I select #{hash['session'].inspect} from \"acceptance[period_id]\""
    And    "I select #{hash['room'].inspect} from \"acceptance[room_id]\""
    And    'I press "Accept"'
  end
  And 'I follow "logout"'  
  
end
