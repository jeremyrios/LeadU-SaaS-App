class StaticPagesController < ApplicationController
  
  def index
    if signed_in?
      redirect_to :home
    end
  end
  
  def about
    
  end
  
  def mbinfo
  end

  def wifm
  end

end
