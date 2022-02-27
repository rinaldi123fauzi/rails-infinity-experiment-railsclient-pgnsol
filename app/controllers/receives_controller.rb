class ReceivesController < ApplicationController
  before_action :set_receife, only: %i[ show edit update destroy ]
  include ReceivesHelper

  def exports
    @getReceive = Receive.find(params[:id])
    respond_to do |format|
      format.html { head :no_content }
      format.pdf do
        # render :orientation => 'Landscape',:encoding => "utf8", :layout => "pdf_layout", pdf: "assessment_pdf.pdf"
        render :orientation => 'Landscape', :encoding => "utf8", :layout => "pdf_layout", pdf: "reportLogin_" + Time.now.strftime('%Y%m%d%H%I%S')
        # render :orientation => 'Portrait',:encoding => "utf8", :layout => "pdf_layout", pdf: "reportQMS_" + Time.now.strftime('%Y%m%d%H%I%S') + ".pdf"
      end
    end
  end

  # GET /receives or /receives.json
  def getSpesifikasiBarang
    kode_barang = params[:id]
    render json: Item.select(:ukuran,:merek,:serial,:tipe,:lain)
                        .where('id = ?', kode_barang)
                        .map{ |vendor|
                            {:value => vendor.ukuran, :merek => vendor.merek, :serial => vendor.serial, :tipe => vendor.tipe, :lain => vendor.lain}
                        }
  end

  def index
    # if current_user.roles.any? { |r| r.name == 'Kadep Penerimaan' || r.name == 'Admin Penerimaan'}
      @receives = Receive.all

      getRole = RoleAssignment.find_by_user_id(current_user.id)
      if current_user.roles.any? { |r| r.name == 'Kadep Persediaan'}
        @penerimaan = Receive.where('status_id != 1').order(:created_at => :desc)
      elsif current_user.roles.any? { |r| r.name == 'Admin Persediaan'}
        @penerimaan = Receive.order(:created_at => :desc)
      else
        @penerimaan = ReceiveHistory.where(role_id: getRole.role_id).select('DISTINCT ON (receive_id) *').order('receive_id DESC, created_at DESC')
      end

    # else
    #   if current_user.roles.any? { |r| r.name == 'Staff Gudang'}
    #     @receives = Receive.where('status_id IN (?)', [5,6,7])
    #   elsif current_user.roles.any? { |r| r.name == 'Kepala Gudang Area'}
    #     @receives = Receive.where('status_id IN (?)', [7,8,9])
    #   end
    # end
    @warehouse = Warehouse.all
  end

  # GET /receives/1 or /receives/1.json
  def show
    @receive_item = ReceiveItem.new
    @receive_items = ReceiveItem.where(receive_id: @receive.id)
    @amount_price = ReceiveItem.where(receive_id: @receive.id).sum(:jumlah_harga)
    changeStatus(params[:id]) #Receive Helpers
    # if @receive.update(receife_params)
    #   format.html { redirect_to @receive, notice: 'Receive was successfully updated.' }
    #   format.json { render :show, status: :ok, location: @receive }
    # else
    #   format.html { render :edit, status: :unprocessable_entity }
    #   format.json { render json: @receive.errors, status: :unprocessable_entity }
    # end
  end

  # GET /receives/new
  def new
    @receive = Receive.new
  end



  # GET /receives/1/edit
  def edit
  end

  # POST /receives or /receives.json
  def create
    @receive = Receive.new(receife_params)
    @getInisialGudang = Warehouse.find(params[:receive][:warehouse_id])
    respond_to do |format|
      get_month = Time.now.strftime("%m")
      get_year = Time.now.strftime("%y")
      get_last_id = Receive.last
      if get_last_id.present?
        get_last_id = Receive.last.id
        get_next_id = get_last_id + 1
      else
        get_next_id = 001
      end
      @receive.kode_transaksi_penerimaan = "FI-#{@getInisialGudang.inisial}-#{get_month}-#{get_year}-#{get_next_id}"
      if @receive.save
        format.html { redirect_to @receive, notice: 'Receive was successfully created.' }
        format.json { render :show, status: :created, location: @receive }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @receive.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receives/1 or /receives/1.json
  def update
    respond_to do |format|
      if @receive.update(receife_params)
        format.html { redirect_to receives_url, notice: 'Receive was successfully updated.' }
        format.json { render :show, status: :ok, location: @receive }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @receive.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receives/1 or /receives/1.json
  def destroy
    @receive.destroy
    respond_to do |format|
      format.html { redirect_to receives_url, notice: 'Receive was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_receife
    @receive = Receive.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def receife_params
    params.require(:receive).permit(:jenis, :judul_bast, :nomor_bast, :tanggal_bast, :nama_penyedia, :inputer, :catatan, :nomor_po,
                                    :tanggal_po, :project_program, :kode_proyek, :nama_proyek, :kode_akun,
                                    :pemilik_material, :jumlah_harga, :kode_transaksi_penerimaan, :tanggal_transaksi,
                                    :warehouse_id, { dokumen: [] }, :user_id, :id_role, :status_id, :harga_satuan,
                                    :jumlah_harga_bast, :jumlah_pesanan, :jumlah_terima, :kategori_kode, :lokasi_penempatan,
                                    :division_id)
  end
end
