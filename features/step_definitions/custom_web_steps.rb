When /^(?:|I )select "([^\"]*)" as the date$/ do |date|
  date = parsed_time(date)
  prefix = "date"
 
  select date.year.to_s, :from => "#{prefix}_#{dt_suffix[:year]}"
  select date.strftime('%B'), :from => "#{prefix}_#{dt_suffix[:month]}"
  select date.day.to_s, :from => "#{prefix}_#{dt_suffix[:day]}"
end
 
When /^(?:|I )select "([^\"]*)" as the "([^\"]*)" date$/ do |date, prefix|
  date = parsed_time(date)
 
  select date.year.to_s, :from => "#{prefix}_#{dt_suffix[:year]}"
  select date.strftime('%B'), :from => "#{prefix}_#{dt_suffix[:month]}"
  select date.day.to_s, :from => "#{prefix}_#{dt_suffix[:day]}"
end
 
When /^(?:|I )select "([^\"]*)" as the date and time$/ do |date|
  date = parsed_time(date)
  prefix = "date"
 
  select date.year.to_s, :from => "#{prefix}_#{dt_suffix[:year]}"
  select date.strftime('%B'), :from => "#{prefix}_#{dt_suffix[:month]}"
  select date.day.to_s, :from => "#{prefix}_#{dt_suffix[:day]}"
  select date.hour.to_s, :from => "#{prefix}_#{dt_suffix[:hour]}"
  select date.min.to_s, :from => "#{prefix}_#{dt_suffix[:minute]}"
end
 
When /^(?:|I )select "([^\"]*)" as the "([^\"]*)" date and time$/ do |date, prefix|
  date = parsed_time(date)
 
  select date.year.to_s, :from => "#{prefix}_#{dt_suffix[:year]}"
  select date.strftime('%B'), :from => "#{prefix}_#{dt_suffix[:month]}"
  select date.day.to_s, :from => "#{prefix}_#{dt_suffix[:day]}"
  select date.hour.to_s, :from => "#{prefix}_#{dt_suffix[:hour]}"
  select date.min.to_s, :from => "#{prefix}_#{dt_suffix[:minute]}"
end



