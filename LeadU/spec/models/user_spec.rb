require 'spec_helper'

describe User do
  
  before { @user = User.new(first_name: "Charles", last_name: "Smith", email: "charlessmith@aol.com", 
    password: "12345678", password_confirmation: "12345678") }
  

  subject { @user }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }
  
  #it { should be_valid }
  
   
  describe "when first name is not present" do
    before {@user.first_name = " " }
    it { should_not be_valid }
  end
  
  describe "when last name is not present" do
    before {@user.last_name = " "}
    it { should_not be_valid }
  end
  
  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end
  
  describe "when first name is too long" do
    before { @user.first_name = "a" * 51 }
    it { should_not be_valid }
  end
  
  describe "when last name is too long" do
    before { @user.last_name = "a" * 51 }
    it { should_not be_valid}
  end

  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.save
    end
    it { should_not be_valid }
  end
  
  describe "when password is not present" do
    before { @user.password = @user.password_confirmation = " " }
    it { should_not be_valid }
  end
  
  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end
  
  describe "when password confirmation is nil" do
    before { @user.password_confirmation = nil }
    it { should_not be_valid }
  end
  
  # describe "creates full name" do
    # (@user.get_full_name).should == "CharlesSmith"
  # end
  
  it "should create full name correctly" do
    (@user.get_full_name).should == "Charles Smith"
  end
  
  it "should not have complete survey" do
    (@user.has_completed_survey?).should == false
  end
  
end
