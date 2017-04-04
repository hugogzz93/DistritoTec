class HomeController < ApplicationController
	layout "frontpage", only: [:frontpage]
	skip_before_action :authenticate_user!, only: [:frontpage]

  def index
    
  end

  def frontpage
  	
  end
end
