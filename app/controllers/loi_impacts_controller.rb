class LoiImpactsController < ApplicationController
  before_action :set_loi_impact, only: %i[ show edit update destroy ]

  # GET /loi_impacts or /loi_impacts.json
  def index
    @loi_impacts = LoiImpact.all
  end

  # GET /loi_impacts/1 or /loi_impacts/1.json
  def show
  end

  # GET /loi_impacts/new
  def new
    @loi_impact = LoiImpact.new
  end

  # GET /loi_impacts/1/edit
  def edit
  end

  # POST /loi_impacts or /loi_impacts.json
  def create
    @loi_impact = LoiImpact.new(loi_impact_params)

    respond_to do |format|
      if @loi_impact.save
        format.html { redirect_to loi_impact_url(@loi_impact), notice: "Loi impact was successfully created." }
        format.json { render :show, status: :created, location: @loi_impact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @loi_impact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loi_impacts/1 or /loi_impacts/1.json
  def update
    respond_to do |format|
      if @loi_impact.update(loi_impact_params)
        format.html { redirect_to loi_impact_url(@loi_impact), notice: "Loi impact was successfully updated." }
        format.json { render :show, status: :ok, location: @loi_impact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @loi_impact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loi_impacts/1 or /loi_impacts/1.json
  def destroy
    @loi_impact.destroy!

    respond_to do |format|
      format.html { redirect_to loi_impacts_url, notice: "Loi impact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loi_impact
      @loi_impact = LoiImpact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def loi_impact_params
      params.require(:loi_impact).permit(:name, :score)
    end
end
