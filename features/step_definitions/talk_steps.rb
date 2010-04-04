Then /^I should see the URL for the pitch "([^\"]*)"$/ do |talk_title|
  talk = Talk.find_by_title(talk_title)
  Then "I should see #{barcamp_talk_url(talk.barcamp, talk).inspect}"
end

Then /^there should be a talk for "([^\"]*)" titled "([^\"]*)"$/ do |camp_title, talk_title|
  Talk.find_by_title(talk_title).barcamp.should == Barcamp.find_by_title(camp_title)
end

When /^I check the box to accept the "([^\"]*)" talk$/ do |talk_name|
  talk = Talk.find_by_title(talk_name)
  within("tr.#{dom_id(talk)}") do
    check "acceptance[accepted]"
  end
end

Then /^the talk "([^\"]*)" should be accepted for "([^\"]*)"$/ do |talk_name, camp_name|
  Barcamp.find_by_title(camp_name).accepted_talks.should include(Talk.find_by_title(talk_name))
end

Then /^the talk "([^\"]*)" should not be accepted for "([^\"]*)"$/ do |talk_name, camp_name|
  Barcamp.find_by_title(camp_name).accepted_talks.should_not include(Talk.find_by_title(talk_name))
end
