class CategoriesController < ApplicationController
  load_and_authorize_resource

  def index; end

  def show
    @transactions = @category.expenses
  end

  def new; end

  def create; end

  def destroy; end
end
