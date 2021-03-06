module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name
    
    when /the home\s?page/
      '/'
    when /the signup page/
      new_user_registration_path
    when /the rooms page/
      barcamp = Barcamp.active.first
      barcamp_rooms_path(barcamp)
    when /the sessions page/
      barcamp = Barcamp.active.first
      barcamp_periods_path(barcamp)
    when /the talks page for "(.*)"/
      barcamp = Barcamp.find_by_title($1)
      barcamp_talks_path(barcamp)
    when /the talk acceptance page/
      barcamp = Barcamp.active.first
      barcamp_acceptances_path(barcamp)
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
