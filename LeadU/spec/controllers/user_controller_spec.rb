require 'spec_helper'

describe UsersController do
  describe 'handling third party authentication' do
    before(:each) do
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
    end
    context 'given user already exists' do
      it 'should sign in exiting user' do
        visit '/'
        user = User.new(:first_name => 'Test',
                :last_name => 'User',
                :email => 'info@gmail.com',
                :password=> '12345',
                :password_confirmation=>'12345')
        user.save
        click_link 'Sign in with Facebook'
        response.should be_success
      end

    end
    context 'given it is a new user' do
      it 'should call create' do
        visit '/' 
        click_link "Sign in with Facebook"  
        response.should be_success
      end
    end
  end
end