Then /^there should be a session named "([^\"]*)" for "([^\"]*)"$/ do |session_name, barcamp_name|
  Barcamp.find_by_title(barcamp_name).periods.map(&:name).should include(session_name)
end

Then /^"([^\"]*)" for "([^\"]*)" should start at "([^\"]*)"$/ do |session_name, barcamp_name, time_string|
  Barcamp.find_by_title(barcamp_name).periods.find_by_name(session_name).start_time.should == Time.zone.parse(time_string)
end

Then /^"([^\"]*)" for "([^\"]*)" should end at "([^\"]*)"$/ do |session_name, barcamp_name, time_string|
  Barcamp.find_by_title(barcamp_name).periods.find_by_name(session_name).end_time.should == Time.zone.parse(time_string)
end

Given /^the following sessions have been created for "([^\"]*)":$/ do |barcamp_name, table|
  table.hashes.each do |hash|
    #    | session_name | start_time | end_time |
    When  'I am on the sessions page'
    And   'I follow "Add a session"'
    And   "I fill in \"Name\" with #{hash['session_name'].inspect}"
    And   "I select #{hash['start_time'].inspect} as the \"Start\" time"
    And   "I select #{hash['end_time'].inspect} as the \"End\" time"
    And   'I press "Create"'
  end
end