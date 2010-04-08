When /^I request the home page at "([^\"]*)" on the day of the event$/ do |arg1|
  date = Barcamp.active.first.start_time.to_date
  using = [date.strftime('%Y-%m-%d'), arg1].join(" ")
  get "/", :fake_time => Time.parse(using).strftime("%Y-%m-%d %H:%M")
end