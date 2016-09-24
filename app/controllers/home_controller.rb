class HomeController < ApplicationController
  def index
    flash[:notice] = 'Test in our world'
  end
end
