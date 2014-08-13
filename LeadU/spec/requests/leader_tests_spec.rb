require 'spec_helper'

describe "LeaderTests" do
  
  describe "GET /leader_tests" do
    it "works! (now write some real specs)" do
      pending
      get leader_tests_path
      response.status.should be(200)
    end
  end
  
  #before { visit leader_test_path }
  
  it "should have Submit Test button" do
    pending
  end
  
  it "should have title Personality Test" do
    pending
  end
  
  describe "with all questions not filled out" do
    it "should not create an entry in the Personality model" do
      pending
    end
  end
  
  it "should create a personality type in the model" do
    pending
  end
  
  
  
end
