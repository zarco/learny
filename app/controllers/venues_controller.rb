class VenuesController < ApplicationController
  before_filter :authenticate_venue!, except: [:show]
  before_action :set_venue, only: [:show]
  

  def index
  end

  def show
  	@venue_pictures = @venue.venue_pictures.all
  end

  def new
  	@venue = Venue.new
  	@venue_pictures = @venue.venue_pictures.build
    @contact = @venue.contact.build
  end
  
  def create
    @venue = Venue.new(post_params)

     respond_to do |format|
       if @venue.save
         params[:venue_pictures]['avatar'].each do |a|
           @venue_pictures = @venue.venue_pictures.create!(:avatar => a, :venue_id => @venue.id)
	     end
	     format.html { redirect_to @venue, notice: 'Picture was successfully created.' }
       else
         format.html { render action: 'new' }
       end
     end
  end
  
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_venue
    @venue = Venue.find(params[:id])
  end  
end
