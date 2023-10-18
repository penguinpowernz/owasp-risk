class PrivacyViolationImpactsController < ApplicationController
  before_action :set_privacy_violation_impact, only: %i[ show edit update destroy ]

  # GET /privacy_violation_impacts or /privacy_violation_impacts.json
  def index
    @privacy_violation_impacts = PrivacyViolationImpact.all
  end

  # GET /privacy_violation_impacts/1 or /privacy_violation_impacts/1.json
  def show
  end

  # GET /privacy_violation_impacts/new
  def new
    @privacy_violation_impact = PrivacyViolationImpact.new
  end

  # GET /privacy_violation_impacts/1/edit
  def edit
  end

  # POST /privacy_violation_impacts or /privacy_violation_impacts.json
  def create
    @privacy_violation_impact = PrivacyViolationImpact.new(privacy_violation_impact_params)

    respond_to do |format|
      if @privacy_violation_impact.save
        format.html { redirect_to privacy_violation_impact_url(@privacy_violation_impact), notice: "Privacy violation impact was successfully created." }
        format.json { render :show, status: :created, location: @privacy_violation_impact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @privacy_violation_impact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /privacy_violation_impacts/1 or /privacy_violation_impacts/1.json
  def update
    respond_to do |format|
      if @privacy_violation_impact.update(privacy_violation_impact_params)
        format.html { redirect_to privacy_violation_impact_url(@privacy_violation_impact), notice: "Privacy violation impact was successfully updated." }
        format.json { render :show, status: :ok, location: @privacy_violation_impact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @privacy_violation_impact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /privacy_violation_impacts/1 or /privacy_violation_impacts/1.json
  def destroy
    @privacy_violation_impact.destroy!

    respond_to do |format|
      format.html { redirect_to privacy_violation_impacts_url, notice: "Privacy violation impact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_privacy_violation_impact
      @privacy_violation_impact = PrivacyViolationImpact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def privacy_violation_impact_params
      params.require(:privacy_violation_impact).permit(:name, :score)
    end
end
