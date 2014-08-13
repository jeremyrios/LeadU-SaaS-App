class User < ActiveRecord::Base
  
  has_one :survey, :dependent => :destroy #surveys?
  
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :code, :professor, :fbid, :fb_token #codestuffs
  #magic to require a password, make sure passwords match, authenticate
  has_secure_password

  attr_accessor :entered_type
  
  acts_as_followable #method allowing professors to follwer there students/users
  acts_as_follower
  
  before_create { |user| user.email = email.downcase } #help ensure uniqueness
  before_create { create_remember_token(:remember_token) }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :first_name, presence: true, length: {maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates_presence_of :password, :on => :create_or_update, length: { minimum: 5 }
  validates_presence_of :password_confirmation, :on => :create_or_update
  
  #code is how professors are attached to students and can see their students types
  #validates :code, :uniqueness => true, :unless => nil
  #validates_uniqueness_of :code, :unless => nil
  
  def get_full_name
    return self.first_name + " " + self.last_name
  end  

  def has_completed_survey?
    return !self.survey.nil?
  end
  
  def reset_survey
    self.survey = nil
  end

  def send_password_reset
    create_remember_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

   def get_friends
    @graph = Koala::Facebook::API.new(self.fb_token)
    profile = @graph.get_object("me")

    @friends = @graph.get_connections("me", "friends")
    @friends_on_leadu = Hash.new
    @friends_not_on_leadu = Hash.new
    
    @friends.each do |friend|
      name = friend["name"]
      url = "https://graph.facebook.com/" + "#{friend["id"]}" + "/picture"
      user = User.find_by_fbid(friend["id"])
      if user.nil? or user.blank?
        @friends_not_on_leadu[name] = [url, friend["id"]]
      else
        @friends_on_leadu[name] = [url, user.survey.personality_type]
      end
     end
     return [@friends_on_leadu, @friends_not_on_leadu]
    end
  
  private

    def create_remember_token(column)
      begin
        self.remember_token = self[column] = SecureRandom.urlsafe_base64
      end while User.exists?(column => self[column])
    end
    
  
end
