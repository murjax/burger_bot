class BurgerComponentsController < ApplicationController
  before_action :set_burger_component, only: %i[edit update destroy]

  def index
    @breads = BurgerComponent.where(component_type: :bread)
    @patties = BurgerComponent.where(component_type: :patty)
    @cheeses = BurgerComponent.where(component_type: :cheese)
    @toppings = BurgerComponent.where(component_type: :topping)
    @sauces = BurgerComponent.where(component_type: :sauce)
  end

  def new
    @burger_component = BurgerComponent.new(new_params)
  end

  def create
    @burger_component = BurgerComponent.new(permitted_params)

    if @burger_component.save
      redirect_to burger_components_url, notice: 'Ingredient was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @burger_component.update(permitted_params)
      redirect_to burger_components_url, notice: 'Ingredient was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @burger_component.destroy
    redirect_to burger_components_url, notice: 'Ingredient was successfully deleted.'
  end

  private

  def set_burger_component
    @burger_component = BurgerComponent.find(params[:id])
  end

  def permitted_params
    params.require(:burger_component).permit(:name, :component_type, :price)
  end

  def new_params
    params.permit(:component_type)
  end
end
