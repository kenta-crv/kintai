class HomeController < ApplicationController
  def index
  	 @current = Time.now 
     @current_attend = current_user.attends.started.last
  end

  def show
  end
end
