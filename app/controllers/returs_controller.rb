class RetursController < ApplicationController
  before_action :set_retur, only: %i[ show edit update destroy ]

  # GET /returs or /returs.json
  def getPengeluaran
    kode_barang = params[:id]
    render json: MaintenanceAsset.left_outer_joins(:warehouse).select('*')
                        .where('nomor_pengeluaran = ?', kode_barang)
                        .map{ |vendor|
                            {:value => vendor.jenis_pengeluaran, :asal_gudang => vendor.warehouse.nama_gudang, :kode_proyek => vendor.kode_proyek, :nama_proyek => vendor.nama_proyek}
                        }
  end

  def index
    @returs = Retur.all
  end

  # GET /returs/1 or /returs/1.json
  def show
  end

  # GET /returs/new
  def new
    @retur = Retur.new
  end

  # GET /returs/1/edit
  def edit
  end

  # POST /returs or /returs.json
  def create
    @retur = Retur.new(retur_params)

    respond_to do |format|
      if @retur.save
        format.html { redirect_to @retur, notice: "Retur was successfully created." }
        format.json { render :show, status: :created, location: @retur }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @retur.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /returs/1 or /returs/1.json
  def update
    respond_to do |format|
      if @retur.update(retur_params)
        format.html { redirect_to @retur, notice: "Retur was successfully updated." }
        format.json { render :show, status: :ok, location: @retur }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @retur.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /returs/1 or /returs/1.json
  def destroy
    @retur.destroy
    respond_to do |format|
      format.html { redirect_to returs_url, notice: "Retur was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_retur
      @retur = Retur.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def retur_params
      params.require(:retur).permit(:jenis_penerimaan, :no_pengeluaran, :kode_proyek, :nama_proyek, :jenis_pengeluaran, :asal_gudang, :gudang_pengembalian, :nama_inputer, { file: [] }, :keterangan_retur, :nama_proyek)
    end
end
