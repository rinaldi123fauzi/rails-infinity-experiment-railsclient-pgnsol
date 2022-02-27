class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /items or /items.json
  def tambahMasterBarang
    @item = Item.new
  end

  def saveMasterBarang
    @item = Item.new
    @item.nama_barang = params[:items][:nama_barang]
    @item.item_group_id = params[:items][:item_group_id]
    @item.ukuran = params[:items][:ukuran]
    @item.tipe = params[:items][:tipe]
    @item.merek = params[:items][:merek]
    @item.serial = params[:items][:serial]
    @item.lain = params[:items][:lain]
    respond_to do |format|
      if @item.save
        format.html { redirect_to receife_path(params[:receive_id]), notice: "Item was successfully created." }
        format.json { render :index, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @items = Item.all
  end

  # GET /items/1 or /items/1.json
  def show; end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)
    respond_to do |format|
      if @item.save
        format.html { redirect_to items_url, notice: "Item was successfully created." }
        format.json { render :index, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import
    Item.import(param[:file])
    redirect_to items_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end



  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:nama_barang, :kode_qr, :merek, :serial, :tipe, :ukuran, :tipe, :lain,
                                 :item_group_id)
  end
end
