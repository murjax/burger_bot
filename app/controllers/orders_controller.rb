class OrdersController < ApplicationController
  before_action :set_order, only: %i[show destroy]

  def index
    @orders = Order.where(user: current_user)
  end

  def show
  end

  def new
    @order = Order.new
    set_ingredients
  end

  def create
    if burger_creator.save
      redirect_to orders_url, notice: 'Burger saved successfully!'
    else
      set_ingredients
      render :new, status: :unprocessable_entity, notice: 'Problem saving burger. Please try again.'
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_url, notice: 'Order was successfully deleted.'
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def set_ingredients
    @breads = Ingredient.where(user: current_user, ingredient_type: :bread)
    @patties = Ingredient.where(user: current_user, ingredient_type: :patty)
    @cheeses = Ingredient.where(user: current_user, ingredient_type: :cheese)
    @toppings = Ingredient.where(user: current_user, ingredient_type: :topping)
    @sauces = Ingredient.where(user: current_user, ingredient_type: :sauce)
  end

  def permitted_params
    params.permit(:name, :bread, :patty, :cheese, toppings: [], sauces: [])
  end

  def burger_creator
    @burger_creator ||= BurgerCreator.new(permitted_params, current_user)
  end
end
