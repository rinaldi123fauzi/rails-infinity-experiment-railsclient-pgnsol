class SaleHistoriesController < ApplicationController
  before_action :set_sale_history, only: %i[ show edit update destroy ]

  # GET /sale_histories or /sale_histories.json
  def index
    # @sale_histories = SaleHistory.all
    @sale_histories = SaleHistory.all
  end

  # GET /sale_histories/1 or /sale_histories/1.json
  def show
  end

  # GET /sale_histories/new
  def new
    @sale_history = SaleHistory.new
  end

  # GET /sale_histories/1/edit
  def edit
  end

  # POST /sale_histories or /sale_histories.json
  def create
    @sale_history = SaleHistory.new(sale_history_params)

    respond_to do |format|
      if @sale_history.save
        format.html { redirect_to @sale_history, notice: "Sale approval was successfully created." }
        format.json { render :show, status: :created, location: @sale_history }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sale_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sale_histories/1 or /sale_histories/1.json
  def update
    respond_to do |format|
      if @sale_history.update(sale_history_params)
        format.html { redirect_to @sale_history, notice: "Sale approval was successfully updated." }
        format.json { render :show, status: :ok, location: @sale_history }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sale_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sale_histories/1 or /sale_histories/1.json
  def destroy
    @sale_history.destroy
    respond_to do |format|
      format.html { redirect_to sale_histories_url, notice: "Sale approval was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale_history
      @sale_history = SaleHistory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sale_history_params
      params.require(:sale_history).permit(:catatan_penjualan, :user_id, :status_id, :sale_id, :role_id)
    end
end
