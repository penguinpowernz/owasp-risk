class VulnerabilitiesController < ApplicationController
  before_action :set_vulnerability, only: %i[ show edit update destroy ]

  # GET /vulnerabilities or /vulnerabilities.json
  def index
    @vulnerabilities = Vulnerability.all
  end

  # GET /vulnerabilities/1 or /vulnerabilities/1.json
  def show
    @agents = ThreatAgent.all
    
    @agents.each do |agent|
      found = false
      @vulnerability.risks.each do |risk|
        if agent.id == risk.threat_agent_id
          found = true
          break
        end
      end

      next if found

      Risk.create(
        threat_agent: agent,
        vulnerability: @vulnerability
      )
    end
  end

  # GET /vulnerabilities/new
  def new
    @vulnerability = Vulnerability.new
  end

  # GET /vulnerabilities/1/edit
  def edit
  end

  # POST /vulnerabilities or /vulnerabilities.json
  def create
    @vulnerability = Vulnerability.new(vulnerability_params)

    respond_to do |format|
      if @vulnerability.save
        format.html { redirect_to vulnerability_url(@vulnerability), notice: "Vulnerability was successfully created." }
        format.json { render :show, status: :created, location: @vulnerability }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vulnerability.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vulnerabilities/1 or /vulnerabilities/1.json
  def update
    respond_to do |format|
      if @vulnerability.update(vulnerability_params)
        format.html { redirect_to vulnerability_url(@vulnerability), notice: "Vulnerability was successfully updated." }
        format.json { render :show, status: :ok, location: @vulnerability }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vulnerability.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vulnerabilities/1 or /vulnerabilities/1.json
  def destroy
    @vulnerability.destroy!

    respond_to do |format|
      format.html { redirect_to vulnerabilities_url, notice: "Vulnerability was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vulnerability
      @vulnerability = Vulnerability.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vulnerability_params
      params.require(:vulnerability).permit(:name, :desc, :project_id)
    end
end
