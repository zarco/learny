class ExpertsController < ApplicationController
  before_filter :authenticate_expert!
  
  def index
    @workshop=Workshop.new
  end
end
