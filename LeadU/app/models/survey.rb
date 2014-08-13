class Survey < ActiveRecord::Base
  belongs_to :user, :dependent => :destroy
  attr_accessible :ei, :tf, :sn, :jp, :personality_type, :user_id
  serialize :responses
  @@last_test_result = nil
  
  def self.last_test_result=(arg)
    @@last_test_result = arg
  end
  
  def self.last_test_result
    @@last_test_result
  end

  def self.personality_types
    return ["ENFJ", "INFJ", "INTJ", "ENTJ", "ENFP", "INFP", "INTP", "ENTP", "ESFP", "ISFP", "ISTP", "ESTP", "ESFJ", "ISFJ", "ISTJ", "ESTJ"]
  end

  def self.organize(params)
    calculated = {}
    calculated[:ei] = 0
    calculated[:tf] = 0
    calculated[:sn] = 0
    calculated[:jp] = 0
    if params.has_key? :type
      type = params[:type].split("").upcase
      calculated = calculate_entered_type(type)

    else
      calculated, @@last_test_result = grab_responses(params, calculated)
    end
    #########

    calculated[:ei] >= 0 ? calculated[:personality_type] = "E" : calculated[:personality_type] = "I"
    calculated[:sn] >= 0 ? calculated[:personality_type] << "S" : calculated[:personality_type] << "N"
    calculated[:tf] >= 0 ? calculated[:personality_type] << "T" : calculated[:personality_type] << "F"
    calculated[:jp] >= 0 ? calculated[:personality_type] << "J" : calculated[:personality_type] << "P"

    return calculated
  end


  def self.calculate_entered_type(type)
    calculated = {}
    ei = type[0]
    sn = type[1]
    tf = type[2]
    jp = type[3]

    ei == "E" ? calculated[:ei] = 1 : calculated[:ei] = 1
    sn == "S" ? calculated[:sn] = 1 : calculated[:sn] = 1
    tf == "T" ? calculated[:tf] = 1 : calculated[:tf] = 1
    jp == "J" ? calculated[:jp] = 1 : calculated[:jp] = 1

    return calculated
  end

  def self.grab_responses(params, calculated)
    user_responses = {}
    params.each do |key,value|
        if( /EI-\d*/.match(key))
          calculated[:ei] = calculated[:ei]+value.to_i
        end
        if( /TF-\d*/.match(key))
          calculated[:tf] = calculated[:tf]+value.to_i
        end
        if( /SN-\d*/.match(key))
          calculated[:sn] = calculated[:sn]+value.to_i
        end
        if( /JP-\d*/.match(key))
          calculated[:jp] = calculated[:jp]+value.to_i
        end
        user_responses[key] = value
    end
    return calculated, user_responses
  end


end
