 # Adds the 16 personality types
# the command to execute this is as follows:
# rake db:migrate OR rake db:schema:load, and then do rake bootstrap:all



namespace :bootstrap do
  
      body_text = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam cursus. Morbi ut mi. Nullam enim leo, egestas id, condimentum at, laoreet mattis, massa. Sed eleifend nonummy diam. Praesent mauris ante, elementum et, bibendum at, posuere sit amet, nibh. Duis tincidunt lectus quis dui viverra vestibulum. Suspendisse vulputate aliquam dui. Nulla elementum dui ut augue. Aliquam vehicula mi at mauris. Maecenas placerat, nisl at consequat rhoncus, sem nunc gravida justo, quis eleifend arcu velit quis lacus. Morbi magna magna, tincidunt a, mattis non, imperdiet vitae, tellus. Sed odio est, auctor ac, sollicitudin in, consequat vitae, orci. Fusce id felis. Vivamus sollicitudin metus eget eros."
  
      desc "Add the 16 profile types"
      task :profile_defaults => :environment do
        Profile.create( :personality_type => 'ISTJ', :body => body_text, :video_link => 'http://www.youtube.com/watch?v=bIchxfE8TnE', :step_1 => 'step 1 text', :step_2 => 'step 2 text', :step_3 => 'step 3 text', 
                :step_4 => 'step 4 text', :step_5 => 'step 1 text')
        Profile.create( :personality_type => 'ISFJ', :body => body_text, :video_link => 'http://www.youtube.com/watch?v=bIchxfE8TnE', :step_1 => 'step 1 text', :step_2 => 'step 2 text', :step_3 => 'step 3 text', 
                :step_4 => 'step 4 text', :step_5 => 'step 1 text')
        Profile.create( :personality_type => 'INFJ', :body => body_text, :video_link => 'http://www.youtube.com/watch?v=bIchxfE8TnE', :step_1 => 'step 1 text', :step_2 => 'step 2 text', :step_3 => 'step 3 text', 
                :step_4 => 'step 4 text', :step_5 => 'step 1 text')
        Profile.create( :personality_type => 'INTJ', :body => body_text, :video_link => 'http://www.youtube.com/watch?v=bIchxfE8TnE', :step_1 => 'step 1 text', :step_2 => 'step 2 text', :step_3 => 'step 3 text', 
                :step_4 => 'step 4 text', :step_5 => 'step 1 text')
        Profile.create( :personality_type => 'ISTP', :body => body_text, :video_link => 'http://www.youtube.com/watch?v=bIchxfE8TnE', :step_1 => 'step 1 text', :step_2 => 'step 2 text', :step_3 => 'step 3 text', 
                :step_4 => 'step 4 text', :step_5 => 'step 1 text')
        Profile.create( :personality_type => 'ISFP', :body => body_text, :video_link => 'http://www.youtube.com/watch?v=bIchxfE8TnE', :step_1 => 'step 1 text', :step_2 => 'step 2 text', :step_3 => 'step 3 text', 
                :step_4 => 'step 4 text', :step_5 => 'step 1 text')
        Profile.create( :personality_type => 'INFP', :body => body_text, :video_link => 'http://www.youtube.com/watch?v=bIchxfE8TnE', :step_1 => 'step 1 text', :step_2 => 'step 2 text', :step_3 => 'step 3 text', 
                :step_4 => 'step 4 text', :step_5 => 'step 1 text')
        Profile.create( :personality_type => 'INTP', :body => body_text, :video_link => 'http://www.youtube.com/watch?v=bIchxfE8TnE', :step_1 => 'step 1 text', :step_2 => 'step 2 text', :step_3 => 'step 3 text', 
                :step_4 => 'step 4 text', :step_5 => 'step 1 text')
        Profile.create( :personality_type => 'ESTP', :body => body_text, :video_link => 'http://www.youtube.com/watch?v=bIchxfE8TnE', :step_1 => 'step 1 text', :step_2 => 'step 2 text', :step_3 => 'step 3 text', 
                :step_4 => 'step 4 text', :step_5 => 'step 1 text')
        Profile.create( :personality_type => 'ESFP', :body => body_text, :video_link => 'http://www.youtube.com/watch?v=bIchxfE8TnE', :step_1 => 'step 1 text', :step_2 => 'step 2 text', :step_3 => 'step 3 text', 
                :step_4 => 'step 4 text', :step_5 => 'step 1 text')
        Profile.create( :personality_type => 'ENFP', :body => body_text, :video_link => 'http://www.youtube.com/watch?v=bIchxfE8TnE', :step_1 => 'step 1 text', :step_2 => 'step 2 text', :step_3 => 'step 3 text', 
                :step_4 => 'step 4 text', :step_5 => 'step 1 text')
        Profile.create( :personality_type => 'ENTP', :body => body_text, :video_link => 'http://www.youtube.com/watch?v=bIchxfE8TnE', :step_1 => 'step 1 text', :step_2 => 'step 2 text', :step_3 => 'step 3 text', 
                :step_4 => 'step 4 text', :step_5 => 'step 1 text')
        Profile.create( :personality_type => 'ESTJ', :body => body_text, :video_link => 'http://www.youtube.com/watch?v=bIchxfE8TnE', :step_1 => 'step 1 text', :step_2 => 'step 2 text', :step_3 => 'step 3 text', 
                :step_4 => 'step 4 text', :step_5 => 'step 1 text')
        Profile.create( :personality_type => 'ESFJ', :body => body_text, :video_link => 'http://www.youtube.com/watch?v=bIchxfE8TnE', :step_1 => 'step 1 text', :step_2 => 'step 2 text', :step_3 => 'step 3 text', 
                :step_4 => 'step 4 text', :step_5 => 'step 1 text')
        Profile.create( :personality_type => 'ENFJ', :body => body_text, :video_link => 'http://www.youtube.com/watch?v=bIchxfE8TnE', :step_1 => 'step 1 text', :step_2 => 'step 2 text', :step_3 => 'step 3 text', 
                :step_4 => 'step 4 text', :step_5 => 'step 1 text')
        Profile.create( :personality_type => 'ENTJ', :body => body_text, :video_link => 'http://www.youtube.com/watch?v=bIchxfE8TnE', :step_1 => 'step 1 text', :step_2 => 'step 2 text', :step_3 => 'step 3 text', 
                :step_4 => 'step 4 text', :step_5 => 'step 1 text')
                

      end

      desc "Run all bootstrapping tasks"
      task :all => [:profile_defaults]
    end