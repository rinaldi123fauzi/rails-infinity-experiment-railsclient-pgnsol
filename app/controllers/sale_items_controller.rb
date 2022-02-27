class SaleItemsController < ApplicationController
  before_action :set_sale_item, only: %i[ show edit update destroy ]

  # GET /sale_items or /sale_items.json
  def index
    @sale_items = SaleItem.all
  end

  # GET /sale_items/1 or /sale_items/1.json
  def show
  end

  # GET /sale_items/new
  def new
    @sale_item = SaleItem.new
  end

  # GET /sale_items/1/edit
  def edit
  end

  # POST /sale_items or /sale_items.json
  def create
    @sale_item = SaleItem.new
    @sale_item.sale_id = params[:sale_id]
    @sale_item.receive_id = params[:receive_id]
    @sale_item.receive_item_id = params[:receive_item_id]
    @sale_item.jumlah_permintaan = params[:jumlah_permintaan]
    @sale_item.jumlah_keluar = params[:jumlah_keluar]

    respond_to do |format|
      if @sale_item.save
        format.html { redirect_back(fallback_location: root_path)}
        # format.html { redirect_to @sale_item, notice: "Sale item was successfully created." }
        # format.json { render :show, status: :created, location: @sale_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sale_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sale_items/1 or /sale_items/1.json
  def update
    respond_to do |format|
      if @sale_item.update(sale_item_params)
        format.html { redirect_to sale_path(@sale_item.sale_id), notice: "Sale item was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sale_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sale_items/1 or /sale_items/1.json
  def destroy
    @sale_item.destroy
    respond_to do |format|
      format.js { render inline: "location.reload();" }
    end
  end

  def getNamaBarang
    kode_barang = params[:id]
    nama_barang = Item.find(kode_barang)
    render :json => nama_barang.try(:nama_barang).to_json
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale_item
      @sale_item = SaleItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sale_item_params
      params.require(:sale_item).permit( :jumlah_tersedia, :jumlah_keluar, :jumlah_permintaan,
                                         :lokasi_penempatan, :sale_id, :measurement_id, :jumlah_permintaan, :receive_item_id, :warehouse_id)
    end
end
