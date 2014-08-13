class SurveyMetrics < ActiveRecord::Base
  attr_accessible :question, :name, :total, :hits, :accuracy
  
  def self.tally_survey_results(responses, results) 
    found_type = results[:personality_type]
    responses.keys.each do |question_name|
      # simply increase the total tallied questions for each subtype by one
      target_type_a = question_name[0]
      target_type_b = question_name[1]
      @metric = SurveyMetrics.find_by_name(question_name)
      @metric.total += 1
      if responses[question_name] == '1' and found_type.include? target_type_a 
        @metric.hits += 1
      elsif responses[question_name] == '-1' and found_type.include? target_type_b
        @metric.hits += 1
      end
      @metric.accuracy = @metric.total == 0.0 ? 1.0 : @metric.hits.to_f / @metric.total
      @metric.save
    end
  end  
end
