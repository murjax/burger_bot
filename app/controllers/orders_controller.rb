class OrdersController < ApplicationController
  before_action :set_order, only: %i[show]

  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order.new
    set_components
  end

  def create
    if burger_creator.save
      redirect_to orders_url, notice: 'Burger saved successfully!'
    else
      set_components
      render :new, status: :unprocessable_entity, notice: 'Problem saving burger. Please try again.'
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def set_components
    @breads = BurgerComponent.where(component_type: :bread)
    @patties = BurgerComponent.where(component_type: :patty)
    @cheeses = BurgerComponent.where(component_type: :cheese)
    @toppings = BurgerComponent.where(component_type: :topping)
    @sauces = BurgerComponent.where(component_type: :sauce)
  end

  def permitted_params
    params.permit(:name, :bread, :patty, :cheese, toppings: [], sauces: [])
  end

  def burger_creator
    @burger_creator ||= BurgerCreator.new(permitted_params)
  end
end
