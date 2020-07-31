class CocktailsController < ApplicationController
  before_action :set_cocktail, only:[:show]
  def index
    @cocktails = Cocktail.all
  end

  def show #have different doses, how many will it returned
    @doses = @cocktail.doses
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to @cocktail, notice: 'Cocktail was successfully created.'
    else
      render 'new'
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktails_path, notice: "Cocktail deleted"
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
  
  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

end
