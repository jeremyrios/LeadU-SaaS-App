# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'

    when /^the home login page$/
      '/home'

    when /^the sign up page$/
      '/signup'

    when /^the login page$/
      '/login'

    when /^the logout page$/
      '/logout'

    when /^the survey page$/
      '/survey'

    when /^the admin login page$/
      '/admin/login'

    when /^the admin users page$/
      '/admin/users'

    when /^the admin surveys page$/
      '/admin/surveys'

    when /^the admin profiles page$/
      '/admin/profiles'

    when /^the user edit page$/
      '/follow_code'
      
    when /^the edit user profile page$/
      @user = User.find_by_email("john@johnson.com")
      "/edit_profile/#{@user.id}"

    when /^the admin page$/
      '/admin'
      
    when /^the survey metrics page$/
      '/admin/survey_metrics'

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
