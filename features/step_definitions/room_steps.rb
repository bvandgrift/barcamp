Then /^there should be a room named "([^\"]*)"$/ do |room_name|
  Room.find_by_name(room_name).should_not be_nil
end

Given /^the following rooms have been created:$/ do |table|
  table.hashes.map{ |hash| Room.create(:name => hash['room_name'])}
end