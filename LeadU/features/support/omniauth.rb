Before('@omniauth_test') do  
  OmniAuth.config.test_mode = true  

  # the symbol passed to mock_auth is the same as the name of the provider set up in the initializer
  OmniAuth.config.mock_auth[:facebook] = {
   :provider => 'facebook',
   :uid => '1234567',
   :credentials => {
    :token => 'asdf12341'
   },
   :info => {
     :nickname => 'test',
     :email => 'info@gmail.com',
     :name => 'Test User',
     :first_name => 'Test',
     :last_name => 'User',
     :location => 'California',
     :verified => true
    }.stringify_keys!
  }.stringify_keys!

  User.create! :first_name => 'Alex', :last_name => 'Ramos', :email => 'arramos23@gmail.com', :code => nil, :professor => false, :password => 'please', :password_confirmation => 'please', :fbid => '1352547880', :fb_token => 'CAACZAz9SZCzvkBANfhi4aiTgTy76ZANdWpgBZB5aqqtf3Cv38S8oG2yhVjKiG3RbOgamWu0Vvj0hyTyXdih7LyyNZCpYeGCZAqONENNTr9x2I40mnSfhpyjZAu8P74Iqr7T1ocG7o2z8bT4519ZAlTn8809eFqncjno9KZAs7hJOiNr6dxzZBvQQkq'
  User.create! :first_name => 'Maxim', :last_name => 'Bashminov', :email => 'bashminov@gmail.com', :code => nil, :professor => false, :password => 'please', :password_confirmation => 'please', :fbid => '100001444022687', :fb_token => 'CAACZAz9SZCzvkBAHRnLKcZCOuyW12OsYbIn9V6EtSp0tOZBA9N1EvV7BTeVWcm8yukscilZAF7TzuWIOeQuhiIVMUfY1ydvvHSACO3BLKtPGdw00nF8lf2Y5ss3UlweZAjMw99K1rLSh5W8xd0ZBKGaLmnsEkNcvt8HW0mNcZA791kwSZBTq7Tqrt'
  Survey.create! :user_id => 1, :ei => 1, :sn => -1, :tf => 1, :jp => -1, :personality_type => "ENTP"
  Survey.create! :user_id => 2, :ei => 1, :sn => 1, :tf => -1, :jp => -1, :personality_type => "ESFP"
  body_text = body_text = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam cursus. Morbi ut mi. Nullam enim leo, egestas id, condimentum at, laoreet mattis, massa. Sed eleifend nonummy diam. Praesent mauris ante, elementum et, bibendum at, posuere sit amet, nibh. Duis tincidunt lectus quis dui viverra vestibulum. Suspendisse vulputate aliquam dui. Nulla elementum dui ut augue. Aliquam vehicula mi at mauris. Maecenas placerat, nisl at consequat rhoncus, sem nunc gravida justo, quis eleifend arcu velit quis lacus. Morbi magna magna, tincidunt a, mattis non, imperdiet vitae, tellus. Sed odio est, auctor ac, sollicitudin in, consequat vitae, orci. Fusce id felis. Vivamus sollicitudin metus eget eros."
  Profile.create!( :personality_type => 'ESFP', :body => body_text, :video_link => 'http://www.youtube.com/watch?v=bIchxfE8TnE', :step_1 => 'step 1 text', :step_2 => 'step 2 text', :step_3 => 'step 3 text',
                :step_4 => 'step 4 text', :step_5 => 'step 1 text')
  Profile.create!( :personality_type => 'ENTP', :body => body_text, :video_link => 'http://www.youtube.com/watch?v=bIchxfE8TnE', :step_1 => 'step 1 text', :step_2 => 'step 2 text', :step_3 => 'step 3 text',
                :step_4 => 'step 4 text', :step_5 => 'step 1 text')
end

After('@omniauth_test') do
  OmniAuth.config.test_mode = false
  User.find_by_email('arramos23@gmail.com').destroy
  User.find_by_email('bashminov@gmail.com').destroy
  Profile.find_by_personality_type('ESFP').destroy
  Profile.find_by_personality_type('ENTP').destroy
end