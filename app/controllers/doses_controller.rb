class DosesController < ApplicationController

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  def create
    # raise
    @dose = Dose.new(dose_params)

    #@dose = Dose.new(:description => "kjrekenk", :ingredient_id = "45")
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
