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
    @ingredient = Ingredient.new(ingredient_params.merge(user: current_user))

    if @ingredient.save
      redirect_to ingredients_url, notice: 'Ingredient was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    purge_delete_marked_photo

    if @ingredient.update(ingredient_params)
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

  def file_params
    params.require(:ingredient).permit(:purge_photos)
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :ingredient_type, :price, :photo)
  end

  def new_params
    params.permit(:ingredient_type)
  end

  def purge_delete_marked_photo
    return unless file_params[:purge_photos].present? && @ingredient.photo.blob_id == file_params[:purge_photos].to_i

    @ingredient.photo.purge
  end
end
