class DosesController < ApplicationController
  before_action :set_dose, only: [:destroy]

  # GET /doses/new
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  # POST /doses
  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    respond_to do |format|
      if @dose.save
        format.html { redirect_to @cocktail, notice: 'Dose was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # DELETE /doses/1
  def destroy
    @dose.destroy
    respond_to do |format|
      format.html { redirect_to cocktails_url, notice: 'Dose was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dose
      @dose = Dose.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dose_params
      params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
    end
end
