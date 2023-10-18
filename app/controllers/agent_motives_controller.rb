class AgentMotivesController < ApplicationController
  before_action :set_agent_motive, only: %i[ show edit update destroy ]

  # GET /agent_motives or /agent_motives.json
  def index
    @agent_motives = AgentMotive.all
  end

  # GET /agent_motives/1 or /agent_motives/1.json
  def show
  end

  # GET /agent_motives/new
  def new
    @agent_motive = AgentMotive.new
  end

  # GET /agent_motives/1/edit
  def edit
  end

  # POST /agent_motives or /agent_motives.json
  def create
    @agent_motive = AgentMotive.new(agent_motive_params)

    respond_to do |format|
      if @agent_motive.save
        format.html { redirect_to agent_motive_url(@agent_motive), notice: "Agent motive was successfully created." }
        format.json { render :show, status: :created, location: @agent_motive }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @agent_motive.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agent_motives/1 or /agent_motives/1.json
  def update
    respond_to do |format|
      if @agent_motive.update(agent_motive_params)
        format.html { redirect_to agent_motive_url(@agent_motive), notice: "Agent motive was successfully updated." }
        format.json { render :show, status: :ok, location: @agent_motive }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @agent_motive.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agent_motives/1 or /agent_motives/1.json
  def destroy
    @agent_motive.destroy!

    respond_to do |format|
      format.html { redirect_to agent_motives_url, notice: "Agent motive was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agent_motive
      @agent_motive = AgentMotive.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def agent_motive_params
      params.require(:agent_motive).permit(:name, :score)
    end
end
