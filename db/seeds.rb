
barcamp = Barcamp.create(:title => "BarCamp Charlotte III",
          :location => "Area 15", :active => true,
          :start_time => Time.zone.parse('2010-04-10 09:00'),
          :end_time => Time.zone.parse('2010-04-10 18:00'))

barcamp.rooms.create(:name => "1")
barcamp.rooms.create(:name => "2")
barcamp.rooms.create(:name => "3")
barcamp.rooms.create(:name => "4")
barcamp.rooms.create(:name => "5")
barcamp.rooms.create(:name => "6")
          
          
barcamp.periods.create(:name => "Session 1", 
                  :start_time => Time.zone.parse('2010-04-10 10:45'),
                  :end_time => Time.zone.parse('2010-04-10 11:45'))
                  
barcamp.periods.create(:name => "Session 2", 
                  :start_time => Time.zone.parse('2010-04-10 12:15'),
                  :end_time => Time.zone.parse('2010-04-10 13:15'))

barcamp.periods.create(:name => "Lunch", 
                  :start_time => Time.zone.parse('2010-04-10 13:15'),
                  :end_time => Time.zone.parse('2010-04-10 14:30'))                  
                  
barcamp.periods.create(:name => "Session 3", 
                  :start_time => Time.zone.parse('2010-04-10 15:30'),
                  :end_time => Time.zone.parse('2010-04-10 16:30'))
                  
barcamp.periods.create(:name => "Session 4", 
                  :start_time => Time.zone.parse('2010-04-10 17:00'),
                  :end_time => Time.zone.parse('2010-04-10 18:00'))