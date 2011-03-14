OmniAuth.config.test_mode = true

# the symbol passed to mock_auth is the same as the name of the provider set up in the initializer
OmniAuth.config.mock_auth[:twitter] = {
    "provider"=>"twitter",
    "uid"=>"3123671",
    "user_info"=> {"nickname"=>"bigfleet", "name"=>"Jim Van Fleet", 
      "location"=>"Charlotte, NC", 
      "image"=>"http://a0.twimg.com/profile_images/1096124084/Jim-Avatar_punchout_normal.gif", 
      "description"=>"I program the Rubies! Husband of @meganv.  Owner of @itsbspoke and cofounder of @mocksup.", 
      "urls"=>{"Website"=>"http://jimvanfleet.com/", "Twitter"=>"http://twitter.com/bigfleet"}}
}

OmniAuth.config.mock_auth[:facebook] = {
    "provider"=>"facebook",
    "uid"=>"578726210",
    "user_info"=>{"nickname"=>"bigfleet", "email"=>"jim@jimvanfleet.com", "first_name"=>"Jim", 
      "last_name"=>"Fleet", "name"=>"Jim Fleet", 
      "image"=>"http://graph.facebook.com/578726210/picture?type=square", 
      "urls"=>{"Facebook"=>"http://www.facebook.com/bigfleet", "Website"=>nil}}
}


