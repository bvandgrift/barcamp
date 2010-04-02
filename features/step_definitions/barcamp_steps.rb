Given /^an active BarCamp "([^\"]*)"$/ do |title|
  Barcamp.create(:active => true, :title => title)
end