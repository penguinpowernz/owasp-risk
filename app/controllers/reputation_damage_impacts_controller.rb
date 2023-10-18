class ReputationDamageImpactsController < ApplicationController
  before_action :set_reputation_damage_impact, only: %i[ show edit update destroy ]

  # GET /reputation_damage_impacts or /reputation_damage_impacts.json
  def index
    @reputation_damage_impacts = ReputationDamageImpact.all
  end

  # GET /reputation_damage_impacts/1 or /reputation_damage_impacts/1.json
  def show
  end

  # GET /reputation_damage_impacts/new
  def new
    @reputation_damage_impact = ReputationDamageImpact.new
  end

  # GET /reputation_damage_impacts/1/edit
  def edit
  end

  # POST /reputation_damage_impacts or /reputation_damage_impacts.json
  def create
    @reputation_damage_impact = ReputationDamageImpact.new(reputation_damage_impact_params)

    respond_to do |format|
      if @reputation_damage_impact.save
        format.html { redirect_to reputation_damage_impact_url(@reputation_damage_impact), notice: "Reputation damage impact was successfully created." }
        format.json { render :show, status: :created, location: @reputation_damage_impact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reputation_damage_impact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reputation_damage_impacts/1 or /reputation_damage_impacts/1.json
  def update
    respond_to do |format|
      if @reputation_damage_impact.update(reputation_damage_impact_params)
        format.html { redirect_to reputation_damage_impact_url(@reputation_damage_impact), notice: "Reputation damage impact was successfully updated." }
        format.json { render :show, status: :ok, location: @reputation_damage_impact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reputation_damage_impact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reputation_damage_impacts/1 or /reputation_damage_impacts/1.json
  def destroy
    @reputation_damage_impact.destroy!

    respond_to do |format|
      format.html { redirect_to reputation_damage_impacts_url, notice: "Reputation damage impact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reputation_damage_impact
      @reputation_damage_impact = ReputationDamageImpact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reputation_damage_impact_params
      params.require(:reputation_damage_impact).permit(:name, :score)
    end
end
