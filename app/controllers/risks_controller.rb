class RisksController < ApplicationController
  before_action :set_risk, only: %i[ show edit update destroy ]
  before_action :load_references, only: %i[ new edit ]

  # GET /risks or /risks.json
  def index
    args = {}

    case params[:severity]
    when '1', '2', '3', '4', '6', '9'
      args[:severity] = params[:severity].to_i
    when '-1', 'incomplete', '0'
      args[:severity] = [-1, 0, nil]
    end

    if params[:project_id].present?
      args[:vulnerabilities] = { project_id: params[:project_id].to_i }
      @risks = Risk.joins(:vulnerability).where(args)
    else
      @risks = Risk.where(args)
    end
  end

  # GET /risks/1 or /risks/1.json
  def show
  end

  # GET /risks/new
  def new
    @risk = Risk.new
  end

  
  # GET /risks/1/edit
  def edit
  end

  # POST /risks or /risks.json
  def create
    @risk = Risk.new(risk_params)

    respond_to do |format|
      if @risk.save
        format.html { redirect_to risk_url(@risk), notice: "Risk was successfully created." }
        format.json { render :show, status: :created, location: @risk }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @risk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /risks/1 or /risks/1.json
  def update
    respond_to do |format|
      if @risk.update(risk_params)
        format.html { redirect_to risk_url(@risk), notice: "Risk was successfully updated." }
        format.json { render :show, status: :ok, location: @risk }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @risk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /risks/1 or /risks/1.json
  def destroy
    @risk.destroy!

    respond_to do |format|
      format.html { redirect_to risks_url, notice: "Risk was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_risk
      @risk = Risk.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def risk_params
      params.require(:risk).permit(
        :name, 
        :desc, 
        :threat_agent_id,
        :agent_motive_id,
        :agent_opportunity_id,
        :vf_eod_id,
        :vf_eo_e_id,
        :vf_awareness_id,
        :vf_ids_id,
        :ti_loac_id,
        :ti_loav_id,
        :ti_loc_id,
        :ti_loi_id,
        :bi_findam_id,
        :bi_repdam_id,
        :bi_ncomp_id,
        :bi_pv_id
      )
    end

    def load_references
      @agents = ThreatAgent.all
      @motives = AgentMotive.all
      @opportunities = AgentOpportunity.all

      # tech impacts
      @ti_loac_impacts = LoacImpact.all
      @ti_loav_impacts = LoavImpact.all
      @ti_loc_impacts = LocImpact.all
      @ti_loi_impacts = LoiImpact.all

      # business impacts
      @bi_findam_impacts = FinancialDamageImpact.all
      @bi_repdam_impacts = ReputationDamageImpact.all
      @bi_ncomp_impacts = NonComplianceImpact.all
      @bi_pv_impacts = PrivacyViolationImpact.all

      # vulnerability factors
      @vf_eod = VulnerabilityEod.all
      @vf_eo_e = VulnerabilityEoE.all
      @vf_awareness = VulnerabilityAwareness.all
      @vf_ids = VulnerabilityId.all

    end

end
