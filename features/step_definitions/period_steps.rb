Then /^there should be a session named "([^\"]*)" for "([^\"]*)"$/ do |session_name, barcamp_name|
  Barcamp.find_by_title(barcamp_name).periods.map(&:name).should include(session_name)
end

Then /^"([^\"]*)" for "([^\"]*)" should start at "([^\"]*)"$/ do |session_name, barcamp_name, time_string|
  Barcamp.find_by_title(barcamp_name).periods.find_by_name(session_name).start_time.should == parsed_time(time_string)
end

Then /^"([^\"]*)" for "([^\"]*)" should end at "([^\"]*)"$/ do |session_name, barcamp_name, time_string|
  Barcamp.find_by_title(barcamp_name).periods.find_by_name(session_name).end_time.should == parsed_time(time_string)
end

Given /^the following sessions have been created for "([^\"]*)":$/ do |barcamp_name, table|
  base = Barcamp.active.first.start_time
  table.hashes.each do |hash|
    start_time = DateTime.parse([base.strftime("%d/%m/%y"), hash['start_time']].join(" ")).strftime("%m-%d-%y %H:%M")
      end_time = DateTime.parse([base.strftime("%d/%m/%y"), hash['end_time']].join(" ")).strftime("%m-%d-%y %H:%M")
    # the inspect means that you don't have to use quotes
    #    | session_name | start_time | end_time |
    When  'I am on the sessions page'
    And   'I follow "Add a session"'
    And   "I fill in \"Name\" with #{hash['session_name'].inspect}"
    And   "I select #{start_time.inspect} as the \"period_start_time\" date and time"
    And   "I select #{end_time.inspect} as the \"period_end_time\" date and time"
    And   'I press "Create"'
  end
end
