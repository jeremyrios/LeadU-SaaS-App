class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:user].downcase) rescue nil
    if user && user.authenticate(params[:password])
      sign_in_user user
      redirect_to :home

    else
      flash[:error] = 'Invalid email and/or password! Please try again!'
      redirect_to :root
      #render :new
    end
  end

  def destroy
    flash[:notice] = "Signout successful"
    sign_out_user
    redirect_to :root #:home #root_path #root_url?
  end


end
