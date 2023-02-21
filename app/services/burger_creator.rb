class BurgerCreator
  attr_reader :errors

  def initialize(params, user)
    @params = params
    @user = user
    @errors = []
  end

  def save
    create_order
    return false if has_errors?

    add_ingredients
    !has_errors?
  end

  private

  attr_reader :params, :user
  attr_writer :errors
  attr_accessor :order

  def create_order
    self.order = Order.create(order_params)
    self.errors = order.errors.full_messages
  end

  def add_ingredients
    ingredients.each do |ingredient|
      price_cents = ENV['PRICE_SHEETS_ENABLED'] ? ingredient.price_sheet_ingredient.price_cents : ingredient.price_cents
      order_ingredient = OrderIngredient.create(
        order: order,
        ingredient: ingredient,
<<<<<<< HEAD
        price_cents: price_cents
=======
        price_cents: ingredient.price_sheet_ingredient.price_cents
>>>>>>> 2920365 (Add price sheets)
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
      total_cents: total_cents,
      user: user
    }
  end

  def ingredient_ids
    [*params[:bread], *params[:patty], *params[:cheese], *params[:toppings], *params[:sauces]].flatten
  end

  def ingredients
    @ingredients ||= Ingredient.where(id: ingredient_ids)
  end

  def price_sheet
    @price_sheet ||= PriceSheet.find_by(active: true)
  end

  def price_sheet_ingredients
    @price_sheet_ingredients ||= price_sheet.price_sheet_ingredients.where(ingredient_id: ingredient_ids)
  end

  def total_cents
<<<<<<< HEAD
    if ENV['PRICE_SHEETS_ENABLED']
      price_sheet_ingredients.sum(:price_cents)
    else
      ingredients.sum(:price_cents)
    end
=======
    price_sheet_ingredients.sum(:price_cents)
>>>>>>> b8b7382 (Add price sheets)
  end
end
