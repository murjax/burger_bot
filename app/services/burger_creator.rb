class BurgerCreator
  attr_reader :errors

  def initialize(params)
    @params = params
    @errors = []
  end

  def save
    create_order
    return false if has_errors?

    add_components
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

  def add_components
    burger_components.each do |burger_component|
      order_burger_component = OrderBurgerComponent.create(
        order: order,
        burger_component: burger_component,
        price_cents: burger_component.price_cents
      )
      errors.push(order_burger_component.errors.full_messages)
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

  def burger_component_ids
    [*params[:bread], *params[:patty], *params[:cheese], *params[:toppings], *params[:sauces]].flatten
  end

  def burger_components
    @burger_components ||= BurgerComponent.where(id: burger_component_ids)
  end

  def total_cents
    burger_components.sum(:price_cents)
  end
end
