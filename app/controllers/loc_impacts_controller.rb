class LocImpactsController < ApplicationController
  before_action :set_loc_impact, only: %i[ show edit update destroy ]

  # GET /loc_impacts or /loc_impacts.json
  def index
    @loc_impacts = LocImpact.all
  end

  # GET /loc_impacts/1 or /loc_impacts/1.json
  def show
  end

  # GET /loc_impacts/new
  def new
    @loc_impact = LocImpact.new
  end

  # GET /loc_impacts/1/edit
  def edit
  end

  # POST /loc_impacts or /loc_impacts.json
  def create
    @loc_impact = LocImpact.new(loc_impact_params)

    respond_to do |format|
      if @loc_impact.save
        format.html { redirect_to loc_impact_url(@loc_impact), notice: "Loc impact was successfully created." }
        format.json { render :show, status: :created, location: @loc_impact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @loc_impact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loc_impacts/1 or /loc_impacts/1.json
  def update
    respond_to do |format|
      if @loc_impact.update(loc_impact_params)
        format.html { redirect_to loc_impact_url(@loc_impact), notice: "Loc impact was successfully updated." }
        format.json { render :show, status: :ok, location: @loc_impact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @loc_impact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loc_impacts/1 or /loc_impacts/1.json
  def destroy
    @loc_impact.destroy!

    respond_to do |format|
      format.html { redirect_to loc_impacts_url, notice: "Loc impact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loc_impact
      @loc_impact = LocImpact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def loc_impact_params
      params.require(:loc_impact).permit(:name, :score)
    end
end
