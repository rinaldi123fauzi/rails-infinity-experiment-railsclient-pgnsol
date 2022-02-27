class MaintenanceAssetsController < ApplicationController
  before_action :set_maintenance_asset, only: %i[ show edit update destroy ]

  # GET /maintenance_assets or /maintenance_assets.json
  def index
    @maintenance_assets = MaintenanceAsset.all
  end

  # GET /maintenance_assets/1 or /maintenance_assets/1.json
  def show
  end

  # GET /maintenance_assets/new
  def new
    @maintenance_asset = MaintenanceAsset.new
    generate_nomor_pengeluaran
  end

  # GET /maintenance_assets/1/edit
  def edit
    generate_nomor_pengeluaran
  end

  # POST /maintenance_assets or /maintenance_assets.json
  def create
    @maintenance_asset = MaintenanceAsset.new(maintenance_asset_params)

    respond_to do |format|
      if @maintenance_asset.save
        format.html { redirect_to @maintenance_asset, notice: "Maintenance asset was successfully created." }
        format.json { render :show, status: :created, location: @maintenance_asset }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @maintenance_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintenance_assets/1 or /maintenance_assets/1.json
  def update
    respond_to do |format|
      if @maintenance_asset.update(maintenance_asset_params)
        format.html { redirect_to @maintenance_asset, notice: "Maintenance asset was successfully updated." }
        format.json { render :show, status: :ok, location: @maintenance_asset }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @maintenance_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenance_assets/1 or /maintenance_assets/1.json
  def destroy
    @maintenance_asset.destroy
    respond_to do |format|
      format.html { redirect_to maintenance_assets_url, notice: "Maintenance asset was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def generate_nomor_pengeluaran
    get_day = DateTime.now.day.to_s
    get_month = DateTime.now.month.to_s
    get_year = DateTime.now.year.to_s
    @get_data_exists = MaintenanceAsset.all
    if @get_data_exists.empty?
      get_last_id = 001
      get_next_id = get_last_id
      @nomor_pengeluaran = "FO-#{get_day}-#{get_month}-#{get_year}-#{get_next_id}"
    else
      get_last_id = MaintenanceAsset.last.id
      get_next_id = get_last_id + 1
      @nomor_pengeluaran = "FO-#{get_day}-#{get_month}-#{get_year}-#{get_next_id}"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance_asset
      @maintenance_asset = MaintenanceAsset.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def maintenance_asset_params
      params.require(:maintenance_asset).permit(:nomor_pengeluaran, :tanggal_pengeluaran, :jenis_pengeluaran,
                                                :keterangan_pengeluaran, :nama_inputer, :kode_akun, :nama_akun,
                                                :kode_proyek, :nama_proyek, { dokumen_pengeluaran: [] }, :status_id,
                                                :user_id,)
    end
end
