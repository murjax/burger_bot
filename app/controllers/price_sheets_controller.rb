class PriceSheetsController < ApplicationController
  before_action :set_price_sheet, only: %i[edit update destroy]

  def index
    @price_sheets = PriceSheet.where(user: current_user)
  end

  def new
    @price_sheet = PriceSheet.new
  end

  def edit
  end

  def create
    @price_sheet = PriceSheet.new(permitted_params.merge(user: current_user))

    if @price_sheet.save
      redirect_to price_sheets_url, notice: 'Price sheet was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @price_sheet.update(permitted_params)
      redirect_to price_sheets_url, notice: 'Price sheet was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @price_sheet.destroy
    redirect_to price_sheets_url, notice: 'Price sheet was successfully deleted.'
  end

  private

  def set_price_sheet
    @price_sheet = PriceSheet.find(params[:id])
  end

  def permitted_params
    params.require(:price_sheet).permit(:name, :active)
  end
end
