require 'spec_helper'

describe Survey do
 it "should convert test results to correct personality type" do
 	@params = { 'EI-1' => 1, 'EI-2' => -1, 'EI-3' => -1, 'TF-1' => 1, 'TF-2' => 1, 'TF-3' => 1, 'SN-1' => -1, 'SN-2' => -1, 'SN-3' => -1, 'JP-1' => -1, 'JP-2' => -1, 'JP-3' => 1, 'JP-4' => 1}   
 	Survey.organize(@params).should == {:ei=>-1, :tf=>3, :sn=>-3, :jp=>0, :personality_type=>"INTJ"} 
 end
  
 before { @survey = Survey.new(user_id: 1, ei: 4, tf: 2, sn: 3, jp: 6, personality_type: 'ENTP') }
  
 subject { @survey }

 it { should respond_to(:user_id) }
 it { should respond_to(:personality_type) }
 it { should respond_to(:ei) }
 it { should respond_to(:tf) }
 it { should respond_to(:sn) }
 it { should respond_to(:jp) }
 
 describe 'when last test result is entered' do
 	Survey.last_test_result = 'ENTP'
 	Survey.last_test_result.should == 'ENTP'
 end
end
