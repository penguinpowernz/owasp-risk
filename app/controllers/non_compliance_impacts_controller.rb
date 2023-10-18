class NonComplianceImpactsController < ApplicationController
  before_action :set_non_compliance_impact, only: %i[ show edit update destroy ]

  # GET /non_compliance_impacts or /non_compliance_impacts.json
  def index
    @non_compliance_impacts = NonComplianceImpact.all
  end

  # GET /non_compliance_impacts/1 or /non_compliance_impacts/1.json
  def show
  end

  # GET /non_compliance_impacts/new
  def new
    @non_compliance_impact = NonComplianceImpact.new
  end

  # GET /non_compliance_impacts/1/edit
  def edit
  end

  # POST /non_compliance_impacts or /non_compliance_impacts.json
  def create
    @non_compliance_impact = NonComplianceImpact.new(non_compliance_impact_params)

    respond_to do |format|
      if @non_compliance_impact.save
        format.html { redirect_to non_compliance_impact_url(@non_compliance_impact), notice: "Non compliance impact was successfully created." }
        format.json { render :show, status: :created, location: @non_compliance_impact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @non_compliance_impact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /non_compliance_impacts/1 or /non_compliance_impacts/1.json
  def update
    respond_to do |format|
      if @non_compliance_impact.update(non_compliance_impact_params)
        format.html { redirect_to non_compliance_impact_url(@non_compliance_impact), notice: "Non compliance impact was successfully updated." }
        format.json { render :show, status: :ok, location: @non_compliance_impact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @non_compliance_impact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /non_compliance_impacts/1 or /non_compliance_impacts/1.json
  def destroy
    @non_compliance_impact.destroy!

    respond_to do |format|
      format.html { redirect_to non_compliance_impacts_url, notice: "Non compliance impact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_non_compliance_impact
      @non_compliance_impact = NonComplianceImpact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def non_compliance_impact_params
      params.require(:non_compliance_impact).permit(:name, :score)
    end
end
