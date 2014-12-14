class ExpertsController < ApplicationController
  before_filter :authenticate_expert!, except: [:show]
  before_action :set_expert, only: [:show]
  
  
  def index
    @workshop=Workshop.new(:reservation => Reservation.new)
  end
  
  
  def show
  end
  
  
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_expert
    @expert = Expert.find(params[:id])
  end
  
end
