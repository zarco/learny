class VenuePicturesController < ApplicationController
  before_action :set_venue_picture, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @venue_pictures = VenuePicture.all
    respond_with(@venue_pictures)
  end

  def show
    respond_with(@venue_picture)
  end

  def new
    @venue_picture = VenuePicture.new
    respond_with(@venue_picture)
  end

  def edit
  end

  def create
    @venue_picture = VenuePicture.new(venue_picture_params)
    @venue_picture.save
    respond_with(@venue_picture)
  end

  def update
    respond_to do |format|
      if @venue_picture.update(venue_picture_params)
        format.html { redirect_to @venue_picture.venue, notice: 'Venue picture was successfully updated.' }
      end 
    end
  end

  def destroy
    @venue_picture.destroy
    respond_with(@venue_picture)
  end

  private
    def set_venue_picture
      @venue_picture = VenuePicture.find(params[:id])
    end

    def venue_picture_params
      params.require(:venue_picture).permit(:venue_id, :avatar)
    end
end
