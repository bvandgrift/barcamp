Then /^there should be a session named "([^\"]*)" for "([^\"]*)"$/ do |session_name, barcamp_name|
  Barcamp.find_by_title(barcamp_name).sessions.map(&:name).should include(session_name)
end

Then /^"([^\"]*)" for "([^\"]*)" should start at "([^\"]*)"$/ do |session_name, barcamp_name, time_string|
  Barcamp.find_by_title(barcamp_name).sessions.find_by_name(session_name).start_time.should == Time.zone.parse(time_string)
end

Then /^"([^\"]*)" for "([^\"]*)" should end at "([^\"]*)"$/ do |session_name, barcamp_name, time_string|
  Barcamp.find_by_title(barcamp_name).sessions.find_by_name(session_name).end_time.should == Time.zone.parse(time_string)
end
