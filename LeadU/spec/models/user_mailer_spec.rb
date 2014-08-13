require "spec_helper"

describe UserMailer do
  pending "password_reset" do
    let(:user) {User.new(:email => "to@example.org", :first_name => "Test", :last_name => "User", :password => "password", :password_confirmation => "password")}
    let(:email) { UserMailer.password_reset :user}

    it "renders the headers" do
      email.subject.should eq("Password reset")
      email.to.should eq(["to@example.org"])
      email.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      email.body.encoded.should match("Hi")
    end
  end

end
