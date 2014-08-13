# IF seed file does not seem to work try the following commands in sequence
# ***************
# rake db:drop
# rake db:create
# rake db:migrate
# rake bootstrap:all
# rake db:seed
# ***************

# All Passwords are "please"

body_text = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam cursus. Morbi ut mi. Nullam enim leo, egestas id, condimentum at, laoreet mattis, massa. Sed eleifend nonummy diam. Praesent mauris ante, elementum et, bibendum at, posuere sit amet, nibh. Duis tincidunt lectus quis dui viverra vestibulum. Suspendisse vulputate aliquam dui. Nulla elementum dui ut augue. Aliquam vehicula mi at mauris. Maecenas placerat, nisl at consequat rhoncus, sem nunc gravida justo, quis eleifend arcu velit quis lacus. Morbi magna magna, tincidunt a, mattis non, imperdiet vitae, tellus. Sed odio est, auctor ac, sollicitudin in, consequat vitae, orci. Fusce id felis. Vivamus sollicitudin metus eget eros."

# user@example.com is the teacher
professor = User.create! :first_name => 'John', :last_name => 'Smith', :email => 'user@example.com', :code => "leader_match", :professor => true, :password => 'please', :password_confirmation => 'please'
student1 = User.create! :first_name => 'Dave', :last_name => 'Jenkins', :email => 'user2@example.com', :code => nil, :professor => false, :password => 'please', :password_confirmation => 'please'
student2 = User.create! :first_name => 'Alice', :last_name => 'Hope', :email => 'user3@example.com', :code => nil, :professor => false, :password => 'please', :password_confirmation => 'please'
student3 = User.create! :first_name => 'Hannah', :last_name => 'Montana', :email => 'user4@example.com', :code => nil, :professor => false, :password => 'please', :password_confirmation => 'please'
student4 = User.create! :first_name => 'Kate', :last_name => 'Rittle', :email => 'user5@example.com', :code => nil, :professor => false, :password => 'please', :password_confirmation => 'please'
student5 = User.create! :first_name => 'Andre', :last_name => 'Wheeler', :email => 'user6@example.com', :code => nil, :professor => false, :password => 'please', :password_confirmation => 'please'

## Now these students are conntected to Professor
student2.follow(professor)
student3.follow(professor)
student4.follow(professor)
student5.follow(professor)

## Creates surveys
survey = Survey.create! :user_id => 1, :ei => 1, :sn => -1, :tf => 1, :jp => -1, :personality_type => "ENTP"
survey = Survey.create! :user_id => 2, :ei => 1, :sn => 1, :tf => -1, :jp => -1, :personality_type => "ESFP"
survey = Survey.create! :user_id => 3, :ei => -1, :sn => 1, :tf => -1, :jp => 1, :personality_type => "ISFJ"
survey = Survey.create! :user_id => 4, :ei => 1, :sn => -1, :tf => -1, :jp => 1, :personality_type => "ENFJ"
survey = Survey.create! :user_id => 5, :ei => -1, :sn => 1, :tf => -1, :jp => -1, :personality_type => "ISFP"
survey = Survey.create! :user_id => 6, :ei => -1, :sn => 1, :tf => -1, :jp => 1, :personality_type => "ISFJ"

## Create profiles
body_text = body_text = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam cursus. Morbi ut mi. Nullam enim leo, egestas id, condimentum at, laoreet mattis, massa. Sed eleifend nonummy diam. Praesent mauris ante, elementum et, bibendum at, posuere sit amet, nibh. Duis tincidunt lectus quis dui viverra vestibulum. Suspendisse vulputate aliquam dui. Nulla elementum dui ut augue. Aliquam vehicula mi at mauris. Maecenas placerat, nisl at consequat rhoncus, sem nunc gravida justo, quis eleifend arcu velit quis lacus. Morbi magna magna, tincidunt a, mattis non, imperdiet vitae, tellus. Sed odio est, auctor ac, sollicitudin in, consequat vitae, orci. Fusce id felis. Vivamus sollicitudin metus eget eros."
  
istj = Profile.create!( :personality_type => 'ISTJ', :body => body_text, :video_link => 'http://www.youtube.com/watch?v=bIchxfE8TnE', :step_1 => 'step 1 text', :step_2 => 'step 2 text', :step_3 => 'step 3 text',
                :step_4 => 'step 4 text', :step_5 => 'step 1 text')
isfj = Profile.create!( :personality_type => 'ISFJ', :body => body_text, :video_link => 'http://www.youtube.com/watch?v=bIchxfE8TnE', :step_1 => 'step 1 text', :step_2 => 'step 2 text', :step_3 => 'step 3 text',
                :step_4 => 'step 4 text', :step_5 => 'step 1 text')
infj = Profile.create!( :personality_type => 'INFJ', :body => body_text, :video_link => 'http://www.youtube.com/watch?v=bIchxfE8TnE', :step_1 => 'step 1 text', :step_2 => 'step 2 text', :step_3 => 'step 3 text',
                :step_4 => 'step 4 text', :step_5 => 'step 1 text')
intj = Profile.create!( :personality_type => 'INTJ', :body => body_text, :video_link => 'http://www.youtube.com/watch?v=bIchxfE8TnE', :step_1 => 'step 1 text', :step_2 => 'step 2 text', :step_3 => 'step 3 text',
                :step_4 => 'step 4 text', :step_5 => 'step 1 text')
istp = Profile.create!( :personality_type => 'ISTP', :body => body_text, :video_link => 'http://www.youtube.com/watch?v=bIchxfE8TnE', :step_1 => 'step 1 text', :step_2 => 'step 2 text', :step_3 => 'step 3 text',
                :step_4 => 'step 4 text', :step_5 => 'step 1 text')
isfp = Profile.create!( :personality_type => 'ISFP', :body => body_text, :video_link => 'http://www.youtube.com/watch?v=bIchxfE8TnE', :step_1 => 'step 1 text', :step_2 => 'step 2 text', :step_3 => 'step 3 text',
                :step_4 => 'step 4 text', :step_5 => 'step 1 text')
infp = Profile.create!( :personality_type => 'INFP', :body => body_text, :video_link => 'http://www.youtube.com/watch?v=bIchxfE8TnE', :step_1 => 'step 1 text', :step_2 => 'step 2 text', :step_3 => 'step 3 text',
                :step_4 => 'step 4 text', :step_5 => 'step 1 text')
intp = Profile.create!( :personality_type => 'INTP', :body => body_text, :video_link => 'http://www.youtube.com/watch?v=bIchxfE8TnE', :step_1 => 'step 1 text', :step_2 => 'step 2 text', :step_3 => 'step 3 text',
                :step_4 => 'step 4 text', :step_5 => 'step 1 text')
estp = Profile.create!( :personality_type => 'ESTP', :body => body_text, :video_link => 'http://www.youtube.com/watch?v=bIchxfE8TnE', :step_1 => 'step 1 text', :step_2 => 'step 2 text', :step_3 => 'step 3 text',
                :step_4 => 'step 4 text', :step_5 => 'step 1 text')
esfp = Profile.create!( :personality_type => 'ESFP', :body => body_text, :video_link => 'http://www.youtube.com/watch?v=bIchxfE8TnE', :step_1 => 'step 1 text', :step_2 => 'step 2 text', :step_3 => 'step 3 text',
                :step_4 => 'step 4 text', :step_5 => 'step 1 text')
enfp = Profile.create!( :personality_type => 'ENFP', :body => body_text, :video_link => 'http://www.youtube.com/watch?v=bIchxfE8TnE', :step_1 => 'step 1 text', :step_2 => 'step 2 text', :step_3 => 'step 3 text',
                :step_4 => 'step 4 text', :step_5 => 'step 1 text')
entp = Profile.create!( :personality_type => 'ENTP', :body => body_text, :video_link => 'http://www.youtube.com/watch?v=bIchxfE8TnE', :step_1 => 'step 1 text', :step_2 => 'step 2 text', :step_3 => 'step 3 text',
                :step_4 => 'step 4 text', :step_5 => 'step 1 text')
estj = Profile.create!( :personality_type => 'ESTJ', :body => body_text, :video_link => 'http://www.youtube.com/watch?v=bIchxfE8TnE', :step_1 => 'step 1 text', :step_2 => 'step 2 text', :step_3 => 'step 3 text',
                :step_4 => 'step 4 text', :step_5 => 'step 1 text')
esfj = Profile.create!( :personality_type => 'ESFJ', :body => body_text, :video_link => 'http://www.youtube.com/watch?v=bIchxfE8TnE', :step_1 => 'step 1 text', :step_2 => 'step 2 text', :step_3 => 'step 3 text',
                :step_4 => 'step 4 text', :step_5 => 'step 1 text')
enfj = Profile.create!( :personality_type => 'ENFJ', :body => body_text, :video_link => 'http://www.youtube.com/watch?v=bIchxfE8TnE', :step_1 => 'step 1 text', :step_2 => 'step 2 text', :step_3 => 'step 3 text',
                :step_4 => 'step 4 text', :step_5 => 'step 1 text')
entj = Profile.create!( :personality_type => 'ENTJ', :body => body_text, :video_link => 'http://www.youtube.com/watch?v=bIchxfE8TnE', :step_1 => 'step 1 text', :step_2 => 'step 2 text', :step_3 => 'step 3 text',
                :step_4 => 'step 4 text', :step_5 => 'step 1 text')


survey_questions = {'EI-1-E' => ['Groups need people to get things going and I am pretty comfortable doing just that', 'me'],
  'EI-1-I' => ['Groups need people to get things going; and I am pretty comfortable doing just that', 'not me'],
  'SN-1-S' => ['When in conversation with people if details are left out', 'I am eager to have them filled in'],
  'SN-1-N' => ['When in conversation with people if details are left out', 'I tend to get the picture without the detail'],
  'SN-2-S' => ['When I delegate work, I tend to err on this side', 'Being overly specific'],
  'SN-2-N' => ['When I delegate work, I tend to err on this side', 'Being too vague'],
  'TF-1-T' => ['Which do you tend to be', 'Tough-minded'],
  'TF-1-F' => ['Which do you tend to be', 'Soft-hearted'],
  'TF-2-T' => ['When working in a team, group harmony is essential', 'No'],
  'TF-2-F' => ['When working in a team, group harmony is essential', 'Yes'],
  'JP-1-J' => ['You are seldom late', 'Yes'],
  'JP-1-P' => ['You are seldom late', 'No'],
  'JP-2-J' => ['It really bothers you to not have things in their place', 'Yes'],
  'JP-2-P' => ['It really bothers you to not have things in their place', 'No'],
  'EI-2-E' => ['I do my best work alone', 'Not me'],
  'EI-2-I' => ['I do my best work alone', 'Me'],
  'SN-3-S' => ['When making decisions, I tend to methodically review similar past situations', 'Me'],
  'SN-3-N' => ['When making decisions, I tend to methodically review similar past situations', 'Not Me'],
  'SN-4-S' => ['When studying a concept like leadership which would you most likely prefer to study', 'Real life examples'],
  'SN-4-N' => ['When studying a concept like leadership which would you most likely prefer to study', 'Ideas and concepts'],
  'TF-3-T' => ['Being impartial is essential when resolving an issue', 'Yes'],
  'TF-3-F' => ['Being impartial is essential when resolving an issue', 'No'],
  'TF-4-T' => ['In general, you find yourself wishing people would be a little more', 'Cool and logical'],
  'TF-4-F' => ['In general, you find yourself wishing people would be a little more', 'Warm and caring'],
  'JP-3-J' => ['You prefer to keep open-ended plans rather than tie events down', 'No'],
  'JP-3-P' => ['You prefer to keep open-ended plans rather than tie events down', 'Yes'],
  'JP-4-J' => ['You can trust yourself to improvise more than to plan', 'No'],
  'JP-4-P' => ['You can trust yourself to improvise more than to plan', 'Yes'],
  'EI-3-E' => ['My best ideas and contributions tend to come through lively give-and-take with others', 'Me'],
  'EI-3-I' => ['My best ideas and contributions tend to come through lively give-and-take with others', 'Not Me'],
  'SN-5-S' => ['What would likely frustrate you more, an approach that is overly', 'In the clouds'],
  'SN-5-N' => ['What would likely frustrate you more, an approach that is overly', 'In the particulars'],
  'SN-6-S' => ['When meeting someone, do you tend to pay attention to', 'Particular physical characteristics'],
  'SN-6-N' => ['When meeting someone, do you tend to pay attention to', 'The "feel" of who they are'],
  'TF-5-T' => ['Which way are you more inclined to treat people', 'Being brutally honest'],
  'TF-5-F' => ['Which way are you more inclined to treat people', 'Soft-pedaling the hard facts'],
  'TF-6-T' => ['In study or work decisions I naturally tend to do the things', 'That move the work along'],
  'TF-6-F' => ['In study or work decisions I naturally tend to do the things', 'That help others work well together'],
  'JP-5-J' => ['It\'s just part of your nature to complete your tasks on time', 'Yes'],
  'JP-5-P' => ['It\'s just part of your nature to complete your tasks on time', 'No'],
  'JP-6-J' => ['You prefer to make decisions', 'As soon as practical'],
  'JP-6-P' => ['You prefer to make decisions', 'Only when it\'s all clear'],
  'EI-4-E' => ['I prefer to share my thanks with', 'Verbal thanks'],
  'EI-4-I' => ['I prefer to share my thanks with', 'A written note'],
  'SN-7-S' => ['Facts', 'speak for themselves'],
  'SN-7-N' => ['Facts', 'usually require interpretation'],
  'SN-8-S' => ['Do you prefer to work with', 'practical information'],
  'SN-8-N' => ['Do you prefer to work with', 'abstract ideas'],
  'TF-7-T' => ['I prefer a speech that', 'Informs me'],
  'TF-7-F' => ['I prefer a speech that', 'Insires me'],
  'TF-8-T' => ['Head over heart', 'Yes'],
  'TF-8-F' => ['Head over heart', 'No'],
  'JP-7-J' => ['Deadlines are', 'Almost always real and should be followed'],
  'JP-7-P' => ['Deadlines are', 'Useful but not always necessary'],
  'JP-8-J' => ['You sometimes focus so intently on the goal that you may miss new information', 'Yes'],
  'JP-8-P' => ['You sometimes focus so intently on the goal that you may miss new information', 'No'],
  'EI-5-E' => ['I find working in large groups of people', 'Energizes me'],
  'EI-5-I' => ['I find working in large groups of people', 'Tires me out'],
  'SN-9-S' => ['If you join up with people who have been working in an area for a long time, would you', 'Assume they know how to do it best'],
  'SN-9-N' => ['If you join up with people who have been working in an area for a long time, would you', 'Keep my eyes open for ways to improve on current systems'],
  'SN-10-S' => ['Which important work would you prefer', 'Execute the plan'],
  'SN-10-N' => ['Which important work would you prefer', 'Create the plan'],
  'TF-9-T' => ['I have little patience for personal interest stories and get irritated when other people get swept up in them', 'Yes'],
  'TF-9-F' => ['I have little patience for personal interest stories and get irritated when other people get swept up in them', 'No'],
  'TF-10-T' => ['When someone is upset, I tend to want to', 'Understand the underlying issue'],
  'TF-10-F' => ['When someone is upset, I tend to want to', 'Make sure they feel understood'],
  'JP-9-J' => ['If you\'re working, but something really interesting comes along, you\'re likely to', 'Keep your focus on your work'],
  'JP-9-P' => ['If you\'re working, but something really interesting comes along, you\'re likely to', 'Leave your work for the time being'],
  'JP-10-J' => ['Which appeals to you more to', 'Focus and finish'],
  'JP-10-P' => ['Which appeals to you more to', 'Create and adapt'],
  'EI-6-E' => ['I like to stay connected to a large group of friends as opposed to a few', 'Me'],
  'EI-6-I' => ['I like to stay connected to a large group of friends as opposed to a few', 'Not me'],
  'SN-11-S' => ['Which do you find a more natural way of seeing how things work', 'Hands-on'],
  'SN-11-N' => ['Which do you find a more natural way of seeing how things work', 'From the balcony'],
  'SN-12-S' => ['Which would you be more inclined to do in planning', 'Look at specific situations that could occur and plan for them'],
  'SN-12-N' => ['Which would you be more inclined to do in planning', 'Focus in on the core idea of your strategy'],
  'TF-11-T' => ['I put others\' needs before my own', 'When it makes sense'],
  'TF-11-F' => ['I put others\' needs before my own', 'If it will make them feel better'],
  'TF-12-T' => ['People are amazingly different. So it helps to', 'Have clear, reasonable rules so they can all get along'],
  'TF-12-F' => ['People are amazingly different. So it helps to', 'Have tons of leeway for individual difference'],
  'JP-11-J' => ['You make "to-do" lists because', 'You just love having lists and finishing things'],
  'JP-11-P' => ['You make "to-do" lists because', 'Without them you know you might not finish things'],
  'JP-12-J' => ['When you\'re still working right up to the deadline you tend to', 'Be frustrated that you didn\'t finish sooner'],
  'JP-12-P' => ['When you\'re still working right up to the deadline you tend to', 'Find it pretty typical and feel energized by the pressure'],
  'EI-7-E' => ['After a long week I prefer to spend Friday night at home with a few friends or alone', 'Not me'],
  'EI-7-I' => ['After a long week I prefer to spend Friday night at home with a few friends or alone', 'Me'],
  'SN-13-S' => ['In a group project which job are you more likely to want to take on', 'Assembling the final project'],
  'SN-13-N' => ['In a group project which job are you more likely to want to take on', 'Coming up with the big picture concept'],
  'SN-14-S' => ['Which seems like a more appealing way to look at a big paper', 'Create a thorough outline'],
  'SN-14-N' => ['Which seems like a more appealing way to look at a big paper', 'Identify the 3 big ideas'],
  'TF-13-T' => ['If I had to fire someone it\'s most important that', 'They understand why'],
  'TF-13-F' => ['If I had to fire someone it\'s most important that', 'They feel cared about'],
  'TF-14-T' => ['In general I prefer to be', 'Fair'],
  'TF-14-F' => ['In general I prefer to be', 'Understanding'],
  'JP-13-J' => ['When someone is telling you a story, you tend to', 'Need to get to the end result'],
  'JP-13-P' => ['When someone is telling you a story, you tend to', 'Feel no great need to get to the end'],
  'JP-14-J' => ['You find it very easy to change plans mid-stream', 'False'],
  'JP-14-P' => ['You find it very easy to change plans mid-stream', 'True'],
  'EI-8-E' => ['I am able to work in distracting and busy environments', 'Me'],
  'EI-8-I' => ['I am able to work in distracting and busy environments', 'Not me'],
  'SN-15-S' => ['Which are you most comfortable trusting, your', 'Experience'],
  'SN-15-N' => ['Which are you most comfortable trusting, your', 'Intuition'],
  'SN-16-S' => ['If you had to quickly assess the suitability of an apartment to rent, would you more likely see if it', 'Meets your specific requirements'],
  'SN-16-N' => ['If you had to quickly assess the suitability of an apartment to rent, would you more likely see if it', 'Just feels right'],
  'TF-15-T' => ['People say I am too analytical about things', 'Yes'],
  'TF-15-F' => ['People say I am too analytical about things', 'No'],
  'TF-16-T' => ['People say I need to stop worrying about others so much', 'No'],
  'TF-16-F' => ['People say I need to stop worrying about others so much', 'Yes'],
  'JP-15-J' => ['I derive pleasure from organizing my life', 'True'],
  'JP-15-P' => ['I derive pleasure from organizing my life', 'False'],
  'JP-16-J' => ['When something unexpected happens your natural tendency is to', 'Act'],
  'JP-16-P' => ['When something unexpected happens your natural tendency is to', 'Wait and watch'],
  'EI-9-E' => ['At a social gathering my conversations tend to be', 'Numerous and varied'],
  'EI-9-I' => ['At a social gathering my conversations tend to be', 'Few and in depth'],
  'SN-17-S' => ['How would you more likely be described', 'Realistic'],
  'SN-17-N' => ['How would you more likely be described', 'Imaginative'],
  'SN-18-S' => ['Which appeals to you more', 'Building'],
  'SN-18-N' => ['Which appeals to you more', 'Designing'],
  'TF-17-T' => ['People who know me well, are more likely to come to me for', 'Solutions'],
  'TF-17-F' => ['People who know me well, are more likely to come to me for', 'Caring'],
  'TF-18-T' => ['I am one of the first people a friend goes to when seeking consolation or sympathy', 'No'],
  'TF-18-F' => ['I am one of the first people a friend goes to when seeking consolation or sympathy', 'Yes'],
  'JP-17-J' => ['The idea of having a plan on vacation is', 'Comforting'],
  'JP-17-P' => ['The idea of having a plan on vacation is', 'Odd'],
  'JP-18-J' => ['In the long run, what\'s better for a team working on a project', 'Excellent results'],
  'JP-18-P' => ['In the long run, what\'s better for a team working on a project', 'Excellent process'],
  'EI-10-E' => ['I often let calls go to voicemail because I don\'t feel like talking', 'Not me'],
  'EI-10-I' => ['I often let calls go to voicemail because I don\'t feel like talking', 'Me'],
  'SN-19-S' => ['With a set of Tinkertoys (varied shaped and colored toys to assemble), which would you be more likely to do first', 'Sort the pieces in like groups'],
  'SN-19-N' => ['With a set of Tinkertoys (varied shaped and colored toys to assemble), which would you be more likely to do first', 'Envision what you might build'],
  'SN-20-S' => ['When approaching a problem are you more at ease moving through it', 'Step-by-step'],
  'SN-20-N' => ['When approaching a problem are you more at ease moving through it', 'Seeing the whole picture'],
  'TF-19-T' => ['Over the long haul, it\'s worse to be', 'Too personal'],
  'TF-19-F' => ['Over the long haul, it\'s worse to be', 'Too objective'],
  'SN-21-S' => ['Which appeals to you more', 'Facts'],
  'SN-21-N' => ['Which appeals to you more', 'Concepts'],
  'JP-19-J' => ['Unfinished business bothers you', 'True'],
  'JP-19-P' => ['Unfinished business bothers you', 'False'],
  'JP-20-J' => ['Which best taps your natural skills on a project', 'Doing good planning on the front end'],
  'JP-20-P' => ['Which best taps your natural skills on a project', 'Contributing with great energy in the final push']
}


1.upto(20) do |i| #JP
  some_total = 0
  some_score = 0
  some_name = 'JP-' + i.to_s # + '-J'
  question_key = some_name + '-J'
  some_question = 'The question for ' + some_name
  SurveyMetrics.create!(:name => some_name, :question => survey_questions[question_key][0],
                        :total => some_total, :hits => some_score,
                        :accuracy => some_total == 0 ? 0 : some_score/some_total)
              
=begin         
  some_name = 'JP-' + i.to_s # + '-P'
  question_key = some_name + '-P'  
  some_question = 'The question for ' + some_name                       
  SurveyMetrics.create!(:name => some_name, :question => survey_questions[question_key][0], :target => 'P',
                        :total => some_total, :score => some_score, :answer => survey_questions[question_key][1], 
                        :accuracy => some_total == 0 ? 0 : some_score/some_total)
=end
end

1.upto(10) do |i| #EI
  some_total = 0
  some_score = 0
  some_name = 'EI-' + i.to_s # + '-E'
  question_key = some_name + '-E'
  some_question = 'The question for ' + some_name
  SurveyMetrics.create!(:name => some_name, :question => survey_questions[question_key][0],
                        :total => some_total, :hits => some_score,
                        :accuracy => some_total == 0 ? 0 : some_score/some_total)
         
=begin              
  some_name = 'EI-' + i.to_s # + '-I'
  question_key = some_name + '-I'
  some_question = 'The question for ' + some_name                       
  SurveyMetrics.create!(:name => some_name, :question => survey_questions[question_key][0], :target => 'I',
                        :total => some_total, :score => some_score, :answer => survey_questions[question_key][1], 
                        :accuracy => some_total == 0 ? 0 : some_score/some_total)
=end
end

1.upto(21) do |i| #SN
  some_total = 0
  some_score = 0
  some_name = 'SN-' + i.to_s # + '-S'
  question_key = some_name + '-S'
  some_question = 'The question for ' + some_name
  SurveyMetrics.create!(:name => some_name, :question => survey_questions[question_key][0],
                        :total => some_total, :hits => some_score,
                        :accuracy => some_total == 0 ? 0 : some_score/some_total)
                       
=begin
  some_name = 'SN-' + i.to_s # + '-N'
  question_key = some_name + '-N'
  some_question = 'The question for ' + some_name                       
  SurveyMetrics.create!(:name => some_name, :question => survey_questions[question_key][0], :target => 'N',
                        :total => some_total, :score => some_score, :answer => survey_questions[question_key][1], 
                        :accuracy => some_total == 0 ? 0 : some_score/some_total)
=end
end

1.upto(19) do |i| #TF
  some_total = 0
  some_score = 0
  some_name = 'TF-' + i.to_s # + '-T'
  question_key = some_name + '-T'
  some_question = 'The question for ' + some_name
  SurveyMetrics.create!(:name => some_name, :question => survey_questions[question_key][0],
                        :total => some_total, :hits => some_score,
                        :accuracy => some_total == 0 ? 0 : some_score/some_total)
=begin
                       
  some_name = 'TF-' + i.to_s # + '-F'
  question_key = some_name + '-F'
  some_question = 'The question for ' + some_name                       
  SurveyMetrics.create!(:name => some_name, :question => survey_questions[question_key][0], :target => 'F',
                        :total => some_total, :score => some_score, :answer => survey_questions[question_key][1], 
                        :accuracy => some_total == 0 ? 0 : some_score/some_total)
=end
end


