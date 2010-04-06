When /^I request the home page at "([^\"]*)" on the day of the event$/ do |arg1|
  time = Time.zone.parse(arg1)
  date = Barcamp.active.first.start_time.to_date
  using = [date.strftime('%Y-%m-%d'), time.strftime("%H:%M")].join(" ")
  get "/", :fake_time => Time.zone.parse(using)
end