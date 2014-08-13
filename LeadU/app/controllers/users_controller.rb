class UsersController < ApplicationController
  before_filter :auth_user, only: [:show]

  def new
    @sign_up = true
    @user = User.new
  end

  def index
  end
  
  def show
    @user = current_user
    if !@user.has_completed_survey?
      redirect_to :survey
    else
      @personality_db = Profile.find_by_personality_type(@user.survey.personality_type)

      @video_url = /v=(.*)/.match(@personality_db.video_link)[1]
      @body = @personality_db.body
      @step_1 = @personality_db.step_1
      @step_2 = @personality_db.step_2
      @step_3 = @personality_db.step_3
      @step_4 = @personality_db.step_4
      @step_5 = @personality_db.step_5
      #User survey bar chart
      survey_data = user_survey_data(@user.survey)
      create_survey_chart(survey_data)

      if @user.fbid
        @leadU_friends = @user.get_friends[0]
        @non_leadU_friends = @user.get_friends[1]
      end
    end

  end
  
  def edit #Add a code so that users can follow. ie Professors/employers use this
    @user = current_user
    @followers = @user.user_followers#array of users that follow current_user
  end
  
  def update_profile
    user_id = params[:id]
    if params[:user]["code"].empty? 
      params[:user].delete("code")
    end
    @user = User.update(user_id, params[:user])
    if @user.save
      flash[:alert] = 'User was successfully updated'
      redirect_to home_path
    else
      flash[:alert] = "Account could not successfully be updated because:\n"
      @user.errors.full_messages.each { |x| flash[:alert] << x + ",\n" }
      redirect_to edit_profile_path(user_id)
    end    
  end
  
  def edit_profile
    @user = current_user
  end

  def update
    @user = current_user
    if params[:user][:code].nil? || params[:user][:code].empty?
      flash[:alert] = "Code cannot be empty"
      redirect_to edit_user_path
    elsif @user.update_column(:code, params[:user][:code].downcase) #@user.update_attributes(params[:user])
      flash[:success] = "Code updated."
      redirect_to edit_user_path
    elsif
      flash[:alert] = "Unable to create code"
      redirect_to edit_user_path
    end
  end

  def follow_code
    @user = current_user
  end
  
  def followsubmit
    if User.find_by_code(params[:code_string].downcase) and !params[:code_string].empty?
      @parent = User.find_by_code(params[:code_string].downcase)
      @child = current_user
      @child.follow(@parent)
      flash[:success] = 'Code entered.'
      redirect_to home_path
    else
      flash[:alert] = 'Code not correct.'
      redirect_to follow_code_path
    end
    
  end

  def destroy
  end


  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = 'User was successfully created'
      sign_in_user @user
      redirect_to :survey
    else
      redirect_to :signup
      flash[:alert] = "Account could not successfully be created because:\n"
      @user.errors.full_messages.each { |x| flash[:alert] << x + ",\n" }
    end
  end

  def create_with_third_party_auth
    
    auth_hash = request.env['omniauth.auth']
      
    user_hash = {:email => auth_hash['info']['email'], :first_name => auth_hash['info']['first_name'],\
      :last_name => auth_hash['info']['last_name'], :password => auth_hash['credentials']['token'],\
      :password_confirmation => auth_hash['credentials']['token'], :code => nil, :professor => false,\
      :fbid => auth_hash['uid'], :fb_token => auth_hash['credentials']['token']}
    
    user = User.where(email: user_hash[:email])[0]
    if user
      params[:user] = user
      sign_in_user user
      redirect_to home_path
    else
      params[:user] = user_hash
      create
    end 
  end

  #fetch user survey data and set into chart format
  def user_survey_data(user_survey)
    survey_type = ["EI", "SN", "TF", "JP"]
    survey_data = []
    survey_type.each do |w|
     data_arr = []
     data_arr << w[0] + " - " + w[1] << user_survey.send(w.downcase)
     survey_data << data_arr
    end
    return survey_data
  end
  
  #load user survey chart
  def create_survey_chart(survey_data)
    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string', 'Personality' )
    data_table.new_column('number', current_user.first_name)
    data_table.add_rows(survey_data)
    vaxes = [{format: "#", viewWindow: {min: 0}}]	
    ticks = [{v:-20, f:"20"}, {v:-15, f:"15"}, {v:-10, f:"10"}, {v:-5, f:"5"}, {v:0, f:"0"}, {v:5, f:"5"}, {v:10, f:"10"}, {v:15, f:"15"}, {v:20, f:"20"}]
    hAxis = {miValue: -20, maxValue: 20, baseline: 0, direction: -1, ticks: ticks}
    backgroundColor = {stroke: '#171717', strokeWidth: '30', fill: '#a6a6a6'}
    titleTextStyle = { color: 'black', fontName: 'Arial', fontSize: 20, bold: true, italic: true}
    option = { width: "500", height: "315", backgroundColor: backgroundColor, titleTextStyle: titleTextStyle, legend: {position: 'none'}, areaOpacity: 50, vAxes: vaxes, hAxis: hAxis, title: "#{current_user.first_name.titleize}'s Survey Results" }
    @survey_chart = GoogleVisualr::Interactive::BarChart.new(data_table, option)
  end	

  def omniauth_failure
    redirect_to home_path
  end

end
