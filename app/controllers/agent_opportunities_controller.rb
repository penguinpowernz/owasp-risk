class AgentOpportunitiesController < ApplicationController
  before_action :set_agent_opportunity, only: %i[ show edit update destroy ]

  # GET /agent_opportunities or /agent_opportunities.json
  def index
    @agent_opportunities = AgentOpportunity.all
  end

  # GET /agent_opportunities/1 or /agent_opportunities/1.json
  def show
  end

  # GET /agent_opportunities/new
  def new
    @agent_opportunity = AgentOpportunity.new
  end

  # GET /agent_opportunities/1/edit
  def edit
  end

  # POST /agent_opportunities or /agent_opportunities.json
  def create
    @agent_opportunity = AgentOpportunity.new(agent_opportunity_params)

    respond_to do |format|
      if @agent_opportunity.save
        format.html { redirect_to agent_opportunity_url(@agent_opportunity), notice: "Agent opportunity was successfully created." }
        format.json { render :show, status: :created, location: @agent_opportunity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @agent_opportunity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agent_opportunities/1 or /agent_opportunities/1.json
  def update
    respond_to do |format|
      if @agent_opportunity.update(agent_opportunity_params)
        format.html { redirect_to agent_opportunity_url(@agent_opportunity), notice: "Agent opportunity was successfully updated." }
        format.json { render :show, status: :ok, location: @agent_opportunity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @agent_opportunity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agent_opportunities/1 or /agent_opportunities/1.json
  def destroy
    @agent_opportunity.destroy!

    respond_to do |format|
      format.html { redirect_to agent_opportunities_url, notice: "Agent opportunity was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agent_opportunity
      @agent_opportunity = AgentOpportunity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def agent_opportunity_params
      params.require(:agent_opportunity).permit(:name, :score)
    end
end
