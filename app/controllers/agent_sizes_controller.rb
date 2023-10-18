class AgentSizesController < ApplicationController
  before_action :set_agent_size, only: %i[ show edit update destroy ]

  # GET /agent_sizes or /agent_sizes.json
  def index
    @agent_sizes = AgentSize.all
  end

  # GET /agent_sizes/1 or /agent_sizes/1.json
  def show
  end

  # GET /agent_sizes/new
  def new
    @agent_size = AgentSize.new
  end

  # GET /agent_sizes/1/edit
  def edit
  end

  # POST /agent_sizes or /agent_sizes.json
  def create
    @agent_size = AgentSize.new(agent_size_params)

    respond_to do |format|
      if @agent_size.save
        format.html { redirect_to agent_size_url(@agent_size), notice: "Agent size was successfully created." }
        format.json { render :show, status: :created, location: @agent_size }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @agent_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agent_sizes/1 or /agent_sizes/1.json
  def update
    respond_to do |format|
      if @agent_size.update(agent_size_params)
        format.html { redirect_to agent_size_url(@agent_size), notice: "Agent size was successfully updated." }
        format.json { render :show, status: :ok, location: @agent_size }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @agent_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agent_sizes/1 or /agent_sizes/1.json
  def destroy
    @agent_size.destroy!

    respond_to do |format|
      format.html { redirect_to agent_sizes_url, notice: "Agent size was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agent_size
      @agent_size = AgentSize.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def agent_size_params
      params.require(:agent_size).permit(:name, :score)
    end
end
