class ItemGroupsController < ApplicationController
  before_action :set_item_group, only: %i[ show edit update destroy ]

  # GET /item_groups or /item_groups.json
  def index
    @item_groups = ItemGroup.all
  end

  # GET /item_groups/1 or /item_groups/1.json
  def show
  end

  # GET /item_groups/new
  def new
    @item_group = ItemGroup.new
  end

  # GET /item_groups/1/edit
  def edit
  end

  # POST /item_groups or /item_groups.json
  def create
    @item_group = ItemGroup.new(item_group_params)

    respond_to do |format|
      if @item_group.save
        format.html { redirect_to item_groups_url, notice: "Item group was successfully created." }
        format.json { render :index, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_groups/1 or /item_groups/1.json
  def update
    respond_to do |format|
      if @item_group.update(item_group_params)
        format.html { redirect_to item_groups_url, notice: "Item group was successfully updated." }
        format.json { render :index, status: :ok }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_groups/1 or /item_groups/1.json
  def destroy
    @item_group.destroy
    respond_to do |format|
      format.html { redirect_to item_groups_url, notice: "Item group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_group
      @item_group = ItemGroup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_group_params
      params.require(:item_group).permit(:kelompok_barang)
    end
end
