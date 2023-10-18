class LoacImpactsController < ApplicationController
  before_action :set_loac_impact, only: %i[ show edit update destroy ]

  # GET /loac_impacts or /loac_impacts.json
  def index
    @loac_impacts = LoacImpact.all
  end

  # GET /loac_impacts/1 or /loac_impacts/1.json
  def show
  end

  # GET /loac_impacts/new
  def new
    @loac_impact = LoacImpact.new
  end

  # GET /loac_impacts/1/edit
  def edit
  end

  # POST /loac_impacts or /loac_impacts.json
  def create
    @loac_impact = LoacImpact.new(loac_impact_params)

    respond_to do |format|
      if @loac_impact.save
        format.html { redirect_to loac_impact_url(@loac_impact), notice: "Loac impact was successfully created." }
        format.json { render :show, status: :created, location: @loac_impact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @loac_impact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loac_impacts/1 or /loac_impacts/1.json
  def update
    respond_to do |format|
      if @loac_impact.update(loac_impact_params)
        format.html { redirect_to loac_impact_url(@loac_impact), notice: "Loac impact was successfully updated." }
        format.json { render :show, status: :ok, location: @loac_impact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @loac_impact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loac_impacts/1 or /loac_impacts/1.json
  def destroy
    @loac_impact.destroy!

    respond_to do |format|
      format.html { redirect_to loac_impacts_url, notice: "Loac impact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loac_impact
      @loac_impact = LoacImpact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def loac_impact_params
      params.require(:loac_impact).permit(:name, :score)
    end
end
