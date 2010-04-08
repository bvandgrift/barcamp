Given /^an active BarCamp "([^\"]*)"$/ do |title|
  Barcamp.create(:active => true, :title => title, 
          :start_time => Time.zone.parse("2010-04-10 09:00"),
          :end_time => Time.zone.parse("2010-04-10 18:00"))
end

Given /^"([^\"]*)" starts "([^\"]*)"$/ do |title, time_string|
  Barcamp.find_by_title(title).update_attribute(:start_time, Time.zone.parse(time_string))
end

Given /^"([^\"]*)" ends "([^\"]*)"$/ do |title, time_string|
  Barcamp.find_by_title(title).update_attribute(:end_time, Time.zone.parse(time_string))
end

Given /^the seed data is loaded$/ do
  seed_file = File.join(Rails.root, 'db', 'seeds.rb')
  load(seed_file) if File.exist?(seed_file)
end