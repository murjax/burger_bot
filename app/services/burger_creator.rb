class BurgerCreator
  attr_reader :errors

  def initialize(params)
    @params = params
    @errors = []
  end

  def save
    create_order
    return false if has_errors?

    add_ingredients
    !has_errors?
  end

  private

  attr_reader :params
  attr_writer :errors
  attr_accessor :order

  def create_order
    self.order = Order.create(order_params)
    self.errors = order.errors.full_messages
  end

  def add_ingredients
    ingredients.each do |ingredient|
      order_ingredient = OrderIngredient.create(
        order: order,
        ingredient: ingredient,
        price_cents: ingredient.price_cents
      )
      errors.push(order_ingredient.errors.full_messages)
    end
  end

  def has_errors?
    errors.flatten.any?
  end

  def order_params
    {
      name: params[:name],
      total_cents: total_cents
    }
  end

  def ingredient_ids
    [*params[:bread], *params[:patty], *params[:cheese], *params[:toppings], *params[:sauces]].flatten
  end

  def ingredients
    @ingredients ||= Ingredient.where(id: ingredient_ids)
  end

  def total_cents
    ingredients.sum(:price_cents)
  end
end
