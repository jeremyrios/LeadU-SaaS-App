class Profile < ActiveRecord::Base
  attr_accessible :step_1, :step_2, :step_3, :step_4, :step_5, :body, :video_link, :personality_type
end
