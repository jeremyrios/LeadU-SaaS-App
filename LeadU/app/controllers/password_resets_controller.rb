class PasswordResetsController < ApplicationController
  def new
    @user = nil
    render :password_reset
  end

  def create
 	user = User.find_by_email(params[:email])
 	if user
  		user.send_password_reset
  		notice = "Email sent with password reset instructions."
  	else
  		notice = "User does not exist."
  	end
  	redirect_to root_url, :notice => notice
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
    render :password_reset
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, :alert => "Password reset has expired."
    elsif @user.update_attributes(:password => params[:password], :password_confirmation => params[:password_confirmation])
      redirect_to root_url, :notice => "Password has been successfully reset."
    else
      render :password_reset
    end
  end
end
