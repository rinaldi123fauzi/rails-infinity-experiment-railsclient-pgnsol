class SalesController < ApplicationController
  before_action :set_sale, only: %i[ show edit update destroy ]
  include SalesHelper

  # GET /sales or /sales.json

  def getDetailReceiveItem
    kode_barang = params[:id]
    render json: ReceiveItem.select('*')
                        .where('item_id = ?', kode_barang)
                        .map{ |vendor|
                            {:idreceiveitem => vendor.id, :idmeasurement => vendor.measurement_id, :idwarehouse => vendor.warehouse_id, :qrcode => vendor.qr_code, :satuan => vendor.measurement.nama_satuan, :lokasipenempatan => vendor.lokasi_penempatan, :lokasigudang => vendor.warehouse.nama_gudang, :jumlahtersedia => vendor.jumlah_terima}
                        }
  end

  def getNamaAkun
    kode_barang = params[:id]
    uri = URI.parse('http://192.168.60.136:3000/fast/akuns/akunPersediaan')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = false
    request = Net::HTTP::Get.new(uri.request_uri)
    request['Authorization'] = 'Bearer 4854b5b486f4159566c80d842850b967'
    response = http.request(request)

    parsed = JSON.parse(response.body)
    f = {}
    parsed['result']['data'].each do |e|
      if e['kode'].to_s.match(/^#{kode_barang}$/)
        f["#{e['deskripsi']}"] = "#{e['deskripsi']}"
      end
    end

    f.sort_by { |key| key }

    render json:  f.map {|k,v|
                    {:value => v[k]} #[k] digunakan untuk distinct duplikasi data pada array
                  }
  end

  def getNamaProjekOrProgram
    kode_barang = params[:id]
    render json: Receive.select('*')
                        .where('kode_proyek LIKE ?', "%#{kode_barang}%")
                        .map{ |vendor|
                            {:value => vendor.nama_proyek, :kode_akun => vendor.kode_akun}
                        }
  end

  def index
    getRole = RoleAssignment.find_by_user_id(current_user.id)
    if current_user.roles.any? { |r| r.name == 'User Trading' }
      @sales = Sale.order(:created_at)
    elsif current_user.roles.any? { |r| r.name == 'Staff Gudang' }
      @sales = SaleHistory.where(role_id: getRole.role_id).select('DISTINCT ON (sale_id) *').order('sale_id DESC, created_at DESC')
    elsif current_user.roles.any? { |r| r.name == 'Kepala Gudang' }
      @sales = SaleHistory.where(role_id: getRole.role_id).select('DISTINCT ON (sale_id) *').order('sale_id DESC, created_at DESC')
    elsif current_user.roles.any? { |r| r.name == 'Admin Persediaan' }
      @sales = Sale.order(:created_at => :desc)
    elsif current_user.roles.any? { |r| r.name == 'Kadep Persediaan' }
      @sales = Sale.order(:created_at => :desc)
    end
  end

  # GET /sales/1 or /sales/1.json
  def show
    @sale_item = SaleItem.new
    @sale_items = SaleItem.where(sale_id: params[:id])
    @selected_items = ReceiveItem.find_by(id: params[:id])
    changeStatus(params[:id]) #Receive Helpers
    # @sale_items = SaleItem.includes(:receive_items)
  end

  # GET /sales/new
  def new
    @sale = Sale.new
    generate_sale_code
    # @kode_proyek = Receive.where(kode_proyek: get_project_commercial)
    # @dapet_kode = Sale.where(kode_proyek: @kode_proyek)
    # @get_kode_proyek =

    # @k = Receive.pluck(:kode_proyek)

    # @k = Receive.where('kode_proyek IN (?)',kode_proyek: Receive.pluck(:kode_proyek))
    # @k = Receive.where(kode_proyek: Receive.pluck(:kode_proyek))
  end




  def get_receive_data_nama_proyek
    kode_proyek = Receive.params[:id]
    nama_proyek = Receive.where(kode_proyek: kode_proyek)
    render :json => nama_proyek.try(:nama_proyek).to_json
  end

  # def get_receive_data_kode_akun
  #   kode_proyek = params[:id]
  #   kode_akun = Receive.find(kode_proyek)
  #   render :json => kode_akun.try(:kode_akun).to_json
  # end

  # GET /sales/1/edit
  def edit
    generate_sale_code
    # @nama_proyek_dari_penerimaan = Receive.distinct.pluck(:nama_proyek)

  end

  # POST /sales or /sales.json
  def create
    @sale = Sale.new(sale_params)

    respond_to do |format|
      if @sale.save
        # Notification.create(notify_type: 'sale_draft', actor: current_user, user: current_user, target: @sale)
        if Sale.where(:status_id => 6)
          SaleMailer.sale_kepala_gudang.deliver_later
        end
        format.html { redirect_to @sale, notice: "Sale was successfully updated." }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1 or /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        # if Sale.where(:status_id => 6)
        #   SaleMailer.sale_kepala_gudang.deliver_later
        # end
        format.html { redirect_to @sale, notice: "Sale was successfully updated." }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1 or /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: "Sale was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def generate_sale_code
    get_day = DateTime.now.day.to_s
    get_month = DateTime.now.month.to_s
    get_year = DateTime.now.year.to_s
    @get_data_exists = Sale.all
    if @get_data_exists.empty?
      get_last_id = 001
      get_next_id = get_last_id
      @sale_code = "FO-#{get_day}-#{get_month}-#{get_year}-#{get_next_id}"
    else
      get_last_id = Sale.last.id
      get_next_id = get_last_id + 1
      @sale_code = "FO-#{get_day}-#{get_month}-#{get_year}-#{get_next_id}"
    end
  end


  # def getKodeBiaya
  #   uri = URI.parse('http://192.168.60.136:3000/fast/programs')
  #   http = Net::HTTP.new(uri.host, uri.port)
  #   http.use_ssl = false
  #   request = Net::HTTP::Get.new(uri.request_uri)
  #   request['Authorization'] = 'Bearer 4854b5b486f4159566c80d842850b967'
  #   response = http.request(request)
  #
  #   parsed = JSON.parse(response.body)
  #   render json: parsed
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_sale
    @sale = Sale.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def sale_params
    params.require(:sale).permit(:nomor_penjualan, :tanggal_penjualan, :jenis_pengeluaran, :keterangan_penjualan,
                                 :nama_proyek, :kode_proyek, :kode_akun, :nama_akun, :status_id, :user_id, :nama_inputer,
                                 :catatan_penjualan, :receive_id, :kategori_kode, :status_approval, { dokumen_penjualan: [] })
  end
end
