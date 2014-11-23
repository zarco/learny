class VenuesController < ApplicationController
  
  before_filter :authenticate_venue!
  
  def index
  end
end
