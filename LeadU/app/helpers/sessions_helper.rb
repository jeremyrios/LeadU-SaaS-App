module SessionsHelper

  def sign_in_user(user)
    if params[:remember]
      cookies.permanent[:remember_token] = user.remember_token
    else
      cookies[:remember_token] = user.remember_token
    end
    self.current_user = user
  end

  def signed_in?
    !current_user.nil? 
  end
  
  def professor?
    current_user.professor
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    #@current_user ||= User.find_by_remember_token!(cookies[:remember_token]) if cookies[:remember_token]

    if @current_user.nil? and cookies.has_key?(:remember_token)
        @current_user = User.find_by_remember_token(cookies[:remember_token])
        sign_out_user if @current_user.nil?
    end
    return @current_user
  end

  def sign_out_user
    self.current_user = nil
    cookies.delete(:remember_token)
  end

end
