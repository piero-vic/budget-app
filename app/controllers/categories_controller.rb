class CategoriesController < ApplicationController
  load_and_authorize_resource

  def index; end

  def show
    @transactions = @category.expenses
  end

  def new
    @icons = %w[basket laptop credit-card bicycle controller building camera-reels cart2 coin hospital flower1 hammer]
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
