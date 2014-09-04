class ExpertsController < ApplicationController
  before_filter :authenticate_expert!
  
  def index
  end
end
