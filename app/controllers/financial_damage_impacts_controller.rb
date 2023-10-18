class FinancialDamageImpactsController < ApplicationController
  before_action :set_financial_damage_impact, only: %i[ show edit update destroy ]

  # GET /financial_damage_impacts or /financial_damage_impacts.json
  def index
    @financial_damage_impacts = FinancialDamageImpact.all
  end

  # GET /financial_damage_impacts/1 or /financial_damage_impacts/1.json
  def show
  end

  # GET /financial_damage_impacts/new
  def new
    @financial_damage_impact = FinancialDamageImpact.new
  end

  # GET /financial_damage_impacts/1/edit
  def edit
  end

  # POST /financial_damage_impacts or /financial_damage_impacts.json
  def create
    @financial_damage_impact = FinancialDamageImpact.new(financial_damage_impact_params)

    respond_to do |format|
      if @financial_damage_impact.save
        format.html { redirect_to financial_damage_impact_url(@financial_damage_impact), notice: "Financial damage impact was successfully created." }
        format.json { render :show, status: :created, location: @financial_damage_impact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @financial_damage_impact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /financial_damage_impacts/1 or /financial_damage_impacts/1.json
  def update
    respond_to do |format|
      if @financial_damage_impact.update(financial_damage_impact_params)
        format.html { redirect_to financial_damage_impact_url(@financial_damage_impact), notice: "Financial damage impact was successfully updated." }
        format.json { render :show, status: :ok, location: @financial_damage_impact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @financial_damage_impact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /financial_damage_impacts/1 or /financial_damage_impacts/1.json
  def destroy
    @financial_damage_impact.destroy!

    respond_to do |format|
      format.html { redirect_to financial_damage_impacts_url, notice: "Financial damage impact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_financial_damage_impact
      @financial_damage_impact = FinancialDamageImpact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def financial_damage_impact_params
      params.require(:financial_damage_impact).permit(:name, :score)
    end
end
