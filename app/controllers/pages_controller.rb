class PagesController < ApplicationController
  def home
    redirect_to artigos_path if logged_in?
  end
  
  def sobre
  end
end