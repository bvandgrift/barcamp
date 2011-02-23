When /^I request the home page at "([^\"]*):([^\"]*)" on the day of the event$/ do |hour, min|
  date = Barcamp.active.first.start_time.to_date
  t = Time.zone.local(date.year, date.month, date.day, hour, min, 0)
  Timecop.travel(t)
  
  visit "/"
end
