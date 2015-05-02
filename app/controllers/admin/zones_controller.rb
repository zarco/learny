class Admin::ZonesController < Admin::AdminController
  before_action :set_zone, only: [:show, :edit, :update, :destroy]

  # GET /admin/zones
  # GET /admin/zones.json
  def index
    @zones = Zone.all
  end

  # GET /admin/zones/1
  # GET /admin/zones/1.json
  def show
  end

  # GET /admin/zones/new
  def new
    @zone = Zone.new
  end

  # GET /admin/zones/1/edit
  def edit
  end

  # POST /admin/zones
  # POST /admin/zones.json
  def create
    @zone = Zone.new(zone_params)

    respond_to do |format|
      if @zone.save
        format.html { redirect_to [:admin, @zone], notice: 'Zone was successfully created.' }
        format.json { render action: 'show', status: :created, location: @zone }
      else
        format.html { render action: 'new' }
        format.json { render json: @zone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/zones/1
  # PATCH/PUT /admin/zones/1.json
  def update
    respond_to do |format|
      if @zone.update(zone_params)
        format.html { redirect_to [:admin, @zone], notice: 'Zone was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @zone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/zones/1
  # DELETE /admin/zones/1.json
  def destroy
    @zone.destroy
    respond_to do |format|
      format.html { redirect_to admin_zones_url, notice: 'Zone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zone
      @zone = Zone.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def zone_params
      params.require(:zone).permit(:name)
    end
end
