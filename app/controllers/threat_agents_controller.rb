class ThreatAgentsController < ApplicationController
  before_action :set_threat_agent, only: %i[ show edit update destroy ]

  # GET /threat_agents or /threat_agents.json
  def index
    @threat_agents = ThreatAgent.all
  end

  # GET /threat_agents/1 or /threat_agents/1.json
  def show
  end

  # GET /threat_agents/new
  def new
    @threat_agent = ThreatAgent.new
    @skills = AgentSkill.all
    @motives = AgentMotive.all
    @opportunities = AgentOpportunity.all
    @sizes = AgentSize.all
  end

  # GET /threat_agents/1/edit
  def edit
    @skills = AgentSkill.all
    @motives = AgentMotive.all
    @opportunities = AgentOpportunity.all
    @sizes = AgentSize.all
  end

  # POST /threat_agents or /threat_agents.json
  def create
    @threat_agent = ThreatAgent.new(threat_agent_params)

    respond_to do |format|
      if @threat_agent.save
        format.html { redirect_to threat_agent_url(@threat_agent), notice: "Threat agent was successfully created." }
        format.json { render :show, status: :created, location: @threat_agent }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @threat_agent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /threat_agents/1 or /threat_agents/1.json
  def update
    respond_to do |format|
      if @threat_agent.update(threat_agent_params)
        format.html { redirect_to threat_agent_url(@threat_agent), notice: "Threat agent was successfully updated." }
        format.json { render :show, status: :ok, location: @threat_agent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @threat_agent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /threat_agents/1 or /threat_agents/1.json
  def destroy
    @threat_agent.destroy!

    respond_to do |format|
      format.html { redirect_to threat_agents_url, notice: "Threat agent was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_threat_agent
      @threat_agent = ThreatAgent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def threat_agent_params
      params.require(:threat_agent).permit(:name, :desc, :skill_id, :motive_id, :size_id, :opportunity_id)
    end
end
