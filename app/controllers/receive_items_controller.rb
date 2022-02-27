class ReceiveItemsController < ApplicationController
  before_action :set_receive_item, only: %i[ show edit update destroy ]

  # GET /receive_items or /receive_items.json
  def index
    @receive_items = ReceiveItem.order(:created_at)
  end

  # GET /receive_items/1 or /receive_items/1.json
  def show
  end

  def show_sale_item
  end

  # GET /receive_items/new
  def new
    @receive_item = ReceiveItem.new
  end

  # GET /receive_items/1/edit
  def edit
  end

  def edit_sale_item
    set_receive_item
    render :edit
  end


  # POST /receive_items or /receive_items.json
  def create
    @receive_item = ReceiveItem.new(receive_item_params)
    respond_to do |format|
      if @receive_item.save
        format.html { redirect_back(fallback_location: root_path)}
        # format.html { redirect_to @receive_item, notice: "Receive item was successfully created." }
        # format.json { render :show, status: :created, location: @receive_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @receive_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # def edit_receive_item
  #   respond_to do |format|
  #     format.html
  #     format.js
  #   end
  # end

  # PATCH/PUT /receive_items/1 or /receive_items/1.json
  def update
    respond_to do |format|
      if @receive_item.update(receive_item_params)
        if current_user.roles.any? { |r| r.name == 'Staff Gudang'}
          format.html { render :edit }
        else
          format.html { redirect_to receife_path(params[:receive_item][:receive_id]), notice: "Receive Item has updated" }
        end
      # elsif @receive_item.update(receive_item_params)
      #   format.html { redirect_back(fallback_location: proc { @sale})}
        # format.js { render inline: "goBack();" }

        # format.html { redirect_to @receive_item, notice: "Receive item was successfully updated." }
        # format.json { render :show, status: :ok, location: @receive_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @receive_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # def update_sale_item
  #   respond_to do |format|
  #     #todo mau pisahin ketika user update jmlh permintaan tampilnya kembali ke sales/show
  #     if @receive_item.update(params[:jumlah_permintaan])
  #       format.html { redirect_to receife_path(params[:receive_item][:receive_id]), notice: "Sale Item has updated" }
  #       # format.html { redirect_back(fallback_location: proc { @sale})}
  #       # format.js { render inline: "goBack();" }
  #
  #       # format.html { redirect_to @receive_item, notice: "Receive item was successfully updated." }
  #       # format.json { render :show, status: :ok, location: @receive_item }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @receive_item.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  # DELETE /receive_items/1 or /receive_items/1.json
  def destroy
    @receive_item = ReceiveItem.find(params[:id])
    @receive_item.destroy
    respond_to do |format|
      format.js { render inline: "location.reload();" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_receive_item
    @receive_item = ReceiveItem.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def receive_item_params
    params.require(:receive_item).permit(:receive_id, :item_id, :measurement_id, :harga_satuan,
                                         :jumlah_pesanan, :jumlah_terima, :jumlah_harga, :qr_code, :merek, :serial,
                                         :ukuran, :spesifikasi_barang, :lain, :tipe, :jumlah_permintaan, :jumlah_keluar,
                                         :status_item, :warehouse_id)
  end
end
