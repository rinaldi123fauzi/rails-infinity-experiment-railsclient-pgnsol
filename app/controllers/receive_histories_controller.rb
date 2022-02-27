class ReceiveHistoriesController < ApplicationController
  before_action :set_receive_history, only: %i[ show edit update destroy ]

  # GET /receive_histories or /receive_histories.json
  def index
    if current_user.roles.any? { |r| r.name == 'Kadep Persediaan' || r.name == 'Admin Persediaan'}
      @receive_histories = ReceiveHistory.order(:id => :desc)
    else
      @receive_histories = ReceiveHistory.where(role_id: current_user.role_ids).order(:id => :desc)
    end
  end

  def detailList
    @receive_histories = ReceiveHistory.where(role_id: params[:id])
  end

  # GET /receive_histories/1 or /receive_histories/1.json
  def show
  end

  # GET /receive_histories/new
  def new
    @receive_history = ReceiveHistory.new
  end

  # GET /receive_histories/1/edit
  def edit
  end

  # POST /receive_histories or /receive_histories.json
  def create
    @receive_history = ReceiveHistory.new(receive_history_params)

    respond_to do |format|
      if @receive_history.save
        format.html { redirect_to @receive_history, notice: "Penerimaan approval was successfully created." }
        format.json { render :show, status: :created, location: @receive_history }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @receive_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receive_histories/1 or /receive_histories/1.json
  def update
    respond_to do |format|
      if @receive_history.update(receive_history_params)
        format.html { redirect_to @receive_history, notice: "Penerimaan approval was successfully updated." }
        format.json { render :show, status: :ok, location: @receive_history }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @receive_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receive_histories/1 or /receive_histories/1.json
  def destroy
    @receive_history.destroy
    respond_to do |format|
      format.html { redirect_to receive_histories_url, notice: "Penerimaan approval was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receive_history
      @receive_history = ReceiveHistory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def receive_history_params
      params.require(:receive_history).permit(:receive_id, :status_id, :user_id, :role_id, :catatan_penerimaan, :status_approval)
    end
end
