class SurveyController < ApplicationController

  before_filter :auth_user

  def new

  end

  def create
    majority_answered = params[:input]? params[:input].length >= 50 : false
    entered = params[:entered_type]
    if entered
      correct_type = entered.upcase.in? Survey.personality_types
    end
    if params.has_key?(:type) && !Survey.personality_types.include?(params[:type][:type].upcase) || (!correct_type && !majority_answered)
      flash[:notice] = "That is not a correct personality type"
      redirect_to :survey and return
    elsif params.has_key?(:type)
      @survey_params = Survey.organize(params[:type])
      @survey_params[:user_id] = current_user.id
    elsif correct_type
      @survey_params = {:ei => 0, :tf => 0, :sn => 0, :jp => 0, :personality_type => params[:entered_type].upcase, :user_id => current_user.id}
    else
      if !params[:input] or !majority_answered #or params[:input][:manual] == nil
        flash[:notice] = "Please complete the majority of the survey to generate an accurate personality match for you!"
        redirect_to :survey and return
      end
      @survey_params = Survey.organize(params[:input])
      @survey_params[:user_id] = current_user.id
    end

    @survey = Survey.new(@survey_params)
    #current_user.survey = @survey

    # Kludgy way of getting survey responses
    if Survey.last_test_result != nil
      @survey.responses = Survey.last_test_result
      Survey.last_test_result = nil
      SurveyMetrics.tally_survey_results(@survey.responses, @survey_params)
    end

    if @survey.save
      flash[:success] = "Welcome to LeadU!"
      redirect_to home_path
    else
      flash[:notice] = "You may have entered a field wrong"
      render :survey
    end
  end

  def destroy
  end

end
