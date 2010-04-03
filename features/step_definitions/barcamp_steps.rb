Given /^an active BarCamp "([^\"]*)"$/ do |title|
  Barcamp.create(:active => true, :title => title)
end

Given /^"([^\"]*)" starts "([^\"]*)"$/ do |title, time_string|
  Barcamp.find_by_title(title).update_attribute(:start_time, Time.zone.parse(time_string))
end

Given /^"([^\"]*)" ends "([^\"]*)"$/ do |title, time_string|
  Barcamp.find_by_title(title).update_attribute(:end_time, Time.zone.parse(time_string))
end