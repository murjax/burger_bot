class PriceSheetIngredientsController < ApplicationController
  before_action :set_price_sheet_ingredient, only: %i[edit update destroy]
  before_action :set_ingredients, only: %i[new edit]

  def new
    @price_sheet_ingredient = PriceSheetIngredient.new(new_params)
  end

  def edit
  end

  def create
    @price_sheet_ingredient = PriceSheetIngredient.new(permitted_params)

    if @price_sheet_ingredient.save
      redirect_to edit_price_sheet_url(@price_sheet_ingredient.price_sheet_id), notice: 'Ingredient was successfully added.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @price_sheet_ingredient.update(permitted_params)
      redirect_to edit_price_sheet_url(@price_sheet_ingredient.price_sheet_id), notice: 'Ingredient was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @price_sheet_ingredient.destroy
    redirect_to edit_price_sheet_url(@price_sheet_ingredient.price_sheet_id), notice: 'Ingredient was successfully removed.'
  end

  private

  def set_price_sheet_ingredient
    @price_sheet_ingredient = PriceSheetIngredient.find(params[:id])
  end

  def set_ingredients
    @ingredients = Ingredient.where(user: current_user)
  end

  def permitted_params
    params.require(:price_sheet_ingredient).permit(:price_sheet_id, :ingredient_id, :price)
  end

  def new_params
    params.permit(:price_sheet_id)
  end
end
