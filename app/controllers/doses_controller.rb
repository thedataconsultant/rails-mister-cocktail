class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    params[:dose][:ingredient][1..].each do |ingredient_id|
      Dose.create(description: params[:dose][:description], cocktail: @cocktail, ingredient_id: ingredient_id.to_i)
    end
    redirect_to @cocktail
  end

  def destroy
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient)
  end
end
