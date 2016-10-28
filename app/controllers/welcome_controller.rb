class WelcomeController < ApplicationController
  def index
  	redirect_to current_user unless !logged_in?
  	
  end
end
