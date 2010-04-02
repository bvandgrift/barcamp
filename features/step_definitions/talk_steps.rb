Then /^I should see the URL for the pitch "([^\"]*)"$/ do |talk_title|
  talk = Talk.find_by_title(talk_title)
  Then "I should see #{talk_url(talk).inspect}"
end

Then /^"([^\"]*)" should be pitched for "([^\"]*)"$/ do |talk_title, camp_title|
  Talk.find_by_title(talk_title).barcamp.should == Barcamp.find_by_title(camp_title)
end

Then /^"([^\"]*)" should be pitched by "([^\"]*)"$/ do |talk_title, email|
  Talk.find_by_title(talk_title).speaker.should == User.find_by_email(email)
end

Given /^"([^\"]*)" has pitched "([^\"]*)"$/ do |email, pitch_title|
    Given "I am signed up as #{email.inspect}"
    When  'I follow "Pitch a session"'
    When  'I fill in the following:', table([
      [ "Title", pitch_title],
      %w{ Abstract QQ }
      ])    
    When  'I press "Create"'
    Then  'I should see "Your pitch was created successfully."'
    Then  'I follow "logout"'
end
