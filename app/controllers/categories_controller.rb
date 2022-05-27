class CategoriesController < ApplicationController
  load_and_authorize_resource

  def index; end

  def show
    @transactions = @category.expenses
  end

  def new
    @icons = %w[basket-shopping laptop credit-card bus car bicycle gamepad futbol paw graduation-cap hospital
                heart-pulse]
  end

  def create
    if @category.save
      redirect_to categories_path, notice: 'New category added'
    else
      redirect_to new_category_path, alert: 'Something went wrong, try again!!'
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: 'Category deleted'
  end

  protected

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
