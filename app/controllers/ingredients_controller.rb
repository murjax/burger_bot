class IngredientsController < ApplicationController
  before_action :set_ingredient, only: %i[edit update destroy]

  def index
    @breads = Ingredient.where(user: current_user, ingredient_type: :bread)
    @patties = Ingredient.where(user: current_user, ingredient_type: :patty)
    @cheeses = Ingredient.where(user: current_user, ingredient_type: :cheese)
    @toppings = Ingredient.where(user: current_user, ingredient_type: :topping)
    @sauces = Ingredient.where(user: current_user, ingredient_type: :sauce)
  end

  def new
    @ingredient = Ingredient.new(new_params)
  end

  def create
    @ingredient = Ingredient.new(permitted_params.merge(user: current_user))

    if @ingredient.save
      redirect_to ingredients_url, notice: 'Ingredient was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @ingredient.update(permitted_params)
      redirect_to ingredients_url, notice: 'Ingredient was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to ingredients_url, notice: 'Ingredient was successfully deleted.'
  end

  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def permitted_params
    params.require(:ingredient).permit(:name, :ingredient_type, :price)
  end

  def new_params
    params.permit(:ingredient_type)
  end
end
