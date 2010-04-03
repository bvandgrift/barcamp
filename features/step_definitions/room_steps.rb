Then /^there should be a room named "([^\"]*)" for "([^\"]*)"$/ do |room_name, barcamp_title|
  room = Room.find_by_name(room_name)
  room.should_not be_nil
  room.barcamp.should == Barcamp.find_by_title(barcamp_title)
end

Given /^the following rooms have been created for "([^\"]*)":$/ do |barcamp_title, table|
  barcamp = Barcamp.find_by_title(barcamp_title)
  table.hashes.map{ |hash| Room.create(:name => hash['room_name'], :barcamp => barcamp)}
end