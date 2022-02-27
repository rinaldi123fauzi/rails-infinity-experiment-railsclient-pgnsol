class StockOpnamesController < ApplicationController
  before_action :set_stock_opname, only: %i[ show edit update destroy ]

  # GET /stock_opnames or /stock_opnames.json
  def index
    @periode_laporan = params[:periode_laporan]
    @periode_stock = params[:periode_stock]
    @lokasi_gudang = params[:lokasi_gudang]

   
      @stock_opnames = ReceiveItem.all
 
  end

  # GET /stock_opnames/1 or /stock_opnames/1.json
  def show
  end

  # GET /stock_opnames/new
  def new
    @stock_opname = StockOpname.new
  end

  # GET /stock_opnames/1/edit
  def edit
  end

  # POST /stock_opnames or /stock_opnames.json
  def create
    @stock_opname = StockOpname.new(stock_opname_params)

    respond_to do |format|
      if @stock_opname.save
        format.html { redirect_to @stock_opname, notice: "Stock opname was successfully created." }
        format.json { render :show, status: :created, location: @stock_opname }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stock_opname.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stock_opnames/1 or /stock_opnames/1.json
  def update
    respond_to do |format|
      if @stock_opname.update(stock_opname_params)
        format.html { redirect_to @stock_opname, notice: "Stock opname was successfully updated." }
        format.json { render :show, status: :ok, location: @stock_opname }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stock_opname.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stock_opnames/1 or /stock_opnames/1.json
  def destroy
    @stock_opname.destroy
    respond_to do |format|
      format.html { redirect_to stock_opnames_url, notice: "Stock opname was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock_opname
      @stock_opname = StockOpname.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stock_opname_params
      params.require(:stock_opname).permit(:kode_qr_code, :item_id, :tanggal, :jumlah_tersedia, :measurement_id, :lokasi_penempatan, :jumlah_fisik, :selisih, :keterangan, :warehouse_id)
    end
end
