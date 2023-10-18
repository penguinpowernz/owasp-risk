class AgentSkillsController < ApplicationController
  before_action :set_agent_skill, only: %i[ show edit update destroy ]

  # GET /agent_skills or /agent_skills.json
  def index
    @agent_skills = AgentSkill.all
  end

  # GET /agent_skills/1 or /agent_skills/1.json
  def show
  end

  # GET /agent_skills/new
  def new
    @agent_skill = AgentSkill.new
  end

  # GET /agent_skills/1/edit
  def edit
  end

  # POST /agent_skills or /agent_skills.json
  def create
    @agent_skill = AgentSkill.new(agent_skill_params)

    respond_to do |format|
      if @agent_skill.save
        format.html { redirect_to agent_skill_url(@agent_skill), notice: "Agent skill was successfully created." }
        format.json { render :show, status: :created, location: @agent_skill }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @agent_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agent_skills/1 or /agent_skills/1.json
  def update
    respond_to do |format|
      if @agent_skill.update(agent_skill_params)
        format.html { redirect_to agent_skill_url(@agent_skill), notice: "Agent skill was successfully updated." }
        format.json { render :show, status: :ok, location: @agent_skill }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @agent_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agent_skills/1 or /agent_skills/1.json
  def destroy
    @agent_skill.destroy!

    respond_to do |format|
      format.html { redirect_to agent_skills_url, notice: "Agent skill was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agent_skill
      @agent_skill = AgentSkill.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def agent_skill_params
      params.require(:agent_skill).permit(:name, :score)
    end
end
