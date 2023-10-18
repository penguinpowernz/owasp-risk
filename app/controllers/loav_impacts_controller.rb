class LoavImpactsController < ApplicationController
  before_action :set_loav_impact, only: %i[ show edit update destroy ]

  # GET /loav_impacts or /loav_impacts.json
  def index
    @loav_impacts = LoavImpact.all
  end

  # GET /loav_impacts/1 or /loav_impacts/1.json
  def show
  end

  # GET /loav_impacts/new
  def new
    @loav_impact = LoavImpact.new
  end

  # GET /loav_impacts/1/edit
  def edit
  end

  # POST /loav_impacts or /loav_impacts.json
  def create
    @loav_impact = LoavImpact.new(loav_impact_params)

    respond_to do |format|
      if @loav_impact.save
        format.html { redirect_to loav_impact_url(@loav_impact), notice: "Loav impact was successfully created." }
        format.json { render :show, status: :created, location: @loav_impact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @loav_impact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loav_impacts/1 or /loav_impacts/1.json
  def update
    respond_to do |format|
      if @loav_impact.update(loav_impact_params)
        format.html { redirect_to loav_impact_url(@loav_impact), notice: "Loav impact was successfully updated." }
        format.json { render :show, status: :ok, location: @loav_impact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @loav_impact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loav_impacts/1 or /loav_impacts/1.json
  def destroy
    @loav_impact.destroy!

    respond_to do |format|
      format.html { redirect_to loav_impacts_url, notice: "Loav impact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loav_impact
      @loav_impact = LoavImpact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def loav_impact_params
      params.require(:loav_impact).permit(:name, :score)
    end
end
