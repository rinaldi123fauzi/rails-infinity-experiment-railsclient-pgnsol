class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  # GET /projects or /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1 or /projects/1.json
  def show
    @project_item = ProjectItem.new
    @project_items = ProjectItem.where(project_id: @project.id)
  end

  # GET /projects/new
  def new
    @project = Project.new
    generate_project_code
  end

  # GET /projects/1/edit
  def edit
    generate_project_code
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def generate_project_code
    get_day = DateTime.now.day.to_s
    get_month = DateTime.now.month.to_s
    get_year = DateTime.now.year.to_s
    @get_data_exists = ProjectItem.all
    if @get_data_exists.empty?
      get_last_id = 001
      get_next_id = get_last_id
      @project_code = "FO-#{get_day}-#{get_month}-#{get_year}-#{get_next_id}"
    else
      get_last_id = ProjectItem.last.id
      get_next_id = get_last_id + 1
      @project_code = "FO-#{get_day}-#{get_month}-#{get_year}-#{get_next_id}"
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:nomor_pengeluaran, :tanggal_pengeluaran, :jenis_pengeluaran, :kode_proyek,
                                      :nama_proyek, :keterangan_pengeluaran, :nama_inputer, :status_id, :user_id,
                                      :kode_akun, :nama_akun, { dokumen_pengeluaran: [] })
    end
end
