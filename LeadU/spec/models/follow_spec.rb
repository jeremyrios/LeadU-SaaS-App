require 'spec_helper'

describe Follow , :pending => :true do 
 it "should block" do
 	#Follow.create!(:followable_id => 1, :followable_type => "User", :follower_id => 3, :follower_type => "User", :blocked => false, :created_at => "2013-10-22 06:50:47", :updated_at => "2013-10-22 06:50:47")
 	@follower = Follow.new
 	@follower.should_receive(:block!).and_return(true)
 	#@follower.block!
 	@follower.blocked.should == true
 end
end
  
 