class ProjectItemsController < ApplicationController
  before_action :set_project_item, only: %i[ show edit update destroy ]

  # GET /project_items or /project_items.json
  def index
    @project_items = ProjectItem.all
  end

  # GET /project_items/1 or /project_items/1.json
  def show
  end

  # GET /project_items/new
  def new
    @project_item = ProjectItem.new
  end

  # GET /project_items/1/edit
  def edit
  end

  # POST /project_items or /project_items.json
  def create
    @project_item = ProjectItem.new(project_item_params)

    respond_to do |format|
      if @project_item.save
        format.html { redirect_back(fallback_location: root_path)}
        # format.html { redirect_to @project_item, notice: "Project item was successfully created." }
        # format.json { render :show, status: :created, location: @project_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_items/1 or /project_items/1.json
  def update
    respond_to do |format|
      if @project_item.update(project_item_params)
        format.html { redirect_to project_path(@project_item.project_id), notice: "Project item was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_items/1 or /project_items/1.json
  def destroy
    @project_item.destroy
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
    def set_project_item
      @project_item = ProjectItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_item_params
      params.require(:project_item).permit( :item_id, :project_id, :measurement_id, :jumlah_tersedia, :jumlah_keluar, :jumlah_permintaan)
    end
end
